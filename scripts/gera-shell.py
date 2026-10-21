import subprocess
import json

# criando o diretório onde será armazenado o script do experimento e os subdiretórios para cada implementação
nome_dir = input("Digite o nome do diretório onde quer armazenar o script do experimento:")
subprocess.run([
    'mkdir', '-p',
    f'{nome_dir}',
    f'{nome_dir}/sequencial',
    f'{nome_dir}/fastflow',
    f'{nome_dir}/openmp',
    f'{nome_dir}/onetbb',
    f'{nome_dir}/pstl'
    ])

# obtendo o número de threads disponíveis na máquina
n = int(subprocess.run("nproc",  capture_output=True, text=True).stdout)
lista_threads = [1]
for i in range(2, n+1, 2):
    lista_threads.append(i)

# obtendo o nome do processador da máquina
lscpu_str = subprocess.run(['lscpu', '-J'], capture_output=True, text=True).stdout
lscpu_dict = json.loads(lscpu_str)
modelo_cpu = None
for item in lscpu_dict['lscpu']:
    if item['field'] in ('Model name:'):
        modelo_cpu = item['data']
        break
modelo_cpu = modelo_cpu.replace(" ", "-")

# Determinando a classe desejada com salvaguarda
while True:
    classe = input("Digite a classe do experimento (S, W, A, B, C):")
    classe = classe.upper()
    if classe in ['S', 'W', 'A', 'B', 'C']:
        break
    else:
        print("Classe inválida. Digite novamente.")

# capturando os eventos de energia disponíveis na máquina
eventos_brutos = subprocess.run(['perf list | grep energy'], shell=True, capture_output=True, text=True).stdout.splitlines()
eventos = [linha.split()[0] for linha in eventos_brutos]

lista_experimentos = ['cg', 'ep', 'ft', 'is', 'mg']
pastas = ['NPB-SER','../NPB-FF','../NPB-OMP','../NPB-TBB','../NPB-PSTL']

# criando o script do experimento
with open(file=f'{nome_dir}/roda-experimento.sh', mode='w') as arquivo:
    arquivo.write('#!/bin/bash\n')

    for pasta in pastas:
        arquivo.write(f'cd {pasta}/\n')
        for experimento in lista_experimentos:
            arquivo.write(f'make {experimento} CLASS={classe}\n')
    arquivo.write('source libs/tbb-2020.1/build/INSIRA AQUI A PASTA "linux_intel[...]"/tbbvars.sh\n')
    arquivo.write('cd NPB-SER/\n')
    
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        arquivo.writelines([
            f'echo "Iniciando experimento {experimento[:2]}..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tperf stat -a -x \';\' -e {",".join(eventos)},system_time,user_time,duration_time', 
            f' ./bin/{experimento} >/dev/null 2>>"../scripts/{nome_dir}/sequencial/{experimento[:2]}-{classe}-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'])
        arquivo.write('echo "Experimento concluído"\n\n')
    arquivo.write('cd ../NPB-FF/\n')
    
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento[:2]}..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tenv FF_NUM_THREADS={thread} perf stat -a -x \';\' -e {",".join(eventos)}',
            f' ./bin/{experimento} >/dev/null 2>>"../scripts/{nome_dir}/fastflow/{experimento[:2]}-{classe}-{thread}-threads-ff-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'])
            arquivo.write('echo "Experimento concluído"\n\n')
    arquivo.write('cd ../NPB-OMP/\n')
    
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento[:2]}..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tenv OMP_NUM_THREADS={thread} perf stat -a -x \';\' -e {",".join(eventos)},system_time,user_time,duration_time', 
            f' ./bin/{experimento} >/dev/null 2>>"../scripts/{nome_dir}/openmp/{experimento[:2]}-{classe}-{thread}-threads-omp-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'])
            arquivo.write('echo "Experimento concluído"\n\n')
    arquivo.write('cd ../NPB-TBB/\n')

    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento[:2]}..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tenv TBB_NUM_THREADS={thread} perf stat -a -x \';\' -e {",".join(eventos)},system_time,user_time,duration_time', 
            f' ./bin/{experimento} >/dev/null 2>>"../scripts/{nome_dir}/onetbb/{experimento[:2]}-{classe}-{thread}-threads-tbb-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'])
            arquivo.write('echo "Experimento concluído"\n\n')
    
    arquivo.write('cd ../NPB-PSTL/\n')

    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
                f'echo "Iniciando experimento {experimento[:2]}..."\n',
                '\tfor i in {1..10}; do\n',
                f'\t\tperf stat -a -x \';\' -e {",".join(eventos)},system_time,user_time,duration_time',
                f' ./bin/{experimento} {thread} >/dev/null 2>>"../scripts/{nome_dir}/pstl/{experimento[:2]}-{classe}-{thread}-threads-pstl-{modelo_cpu}-$horario.csv"\n',
                '\tdone\n'
            ])
            arquivo.write('echo "Experimento concluído"')