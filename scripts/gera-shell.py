import subprocess
import json

nome_dir = input("Digite o nome do diretório onde quer armazenar o script do experimento:")
subprocess.run(['mkdir',f'{nome_dir}',f'{nome_dir}/sequencial',f'{nome_dir}/fastflow',f'{nome_dir}/openmp',f'{nome_dir}/onetbb',f'{nome_dir}/pstl'])

n = int(subprocess.run("nproc",  capture_output=True).stdout)
lista_threads = [1]
for i in range(2, n+1, 2):
    lista_threads.append(i)

maquina_str = subprocess.run(['lscpu', '-J'], capture_output=True).stdout.decode('utf-8')
maquina_dict = json.loads(maquina_str)
modelo_cpu = None
for item in maquina_dict['lscpu']:
    if item['field'] in ('Model name:'):
        modelo_cpu = item['data']
        break
modelo_cpu = modelo_cpu.replace(" ", "-")

lista_experimentos = ['cg ep ft is mg']
pastas = ['NPB-SER','../NPB-FF','../NPB-OMP','../NPB-TBB','../NPB-PSTL']

while True:
    classe = input("Digite a classe do experimento (S, W, A, B, C):")
    classe = classe.upper()
    if classe in ['S', 'W', 'A', 'B', 'C']:
        break
    else:
        print("Classe inválida. Digite novamente.")

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
            f'\t\tperf stat -a -x \';\' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time', 
            f' ./bin/{experimento} >/dev/null 2>>"../scripts/{nome_dir}/sequencial/{experimento[:2]}-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'])
        arquivo.write('echo "Experimento concluído"\n\n')
    arquivo.write('cd ../NPB-FF/\n')
    
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento[:2]}..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tenv FF_NUM_THREADS={thread} perf stat -a -x \';\' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time',
            f' ./bin/{experimento} >/dev/null 2>>"../scripts/{nome_dir}/fastflow/{experimento[:2]}-{thread}-threads-ff-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'])
            arquivo.write('echo "Experimento concluído"\n\n')
    arquivo.write('cd ../NPB-OMP/\n')
    
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento[:2]}..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tenv OMP_NUM_THREADS={thread} perf stat -a -x \';\' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time', 
            f' ./bin/{experimento} >/dev/null 2>>"../scripts/{nome_dir}/openmp/{experimento[:2]}-{thread}-threads-omp-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'])
            arquivo.write('echo "Experimento concluído"\n\n')
    arquivo.write('cd ../NPB-TBB/\n')

    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento[:2]}..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tenv TBB_NUM_THREADS={thread} perf stat -a -x \';\' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time', 
            f' ./bin/{experimento} >/dev/null 2>>"../scripts/{nome_dir}/onetbb/{experimento[:2]}-{thread}-threads-tbb-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'])
            arquivo.write('echo "Experimento concluído"\n\n')
    
    arquivo.write('cd ../NPB-PSTL/\n')

    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
                f'echo "Iniciando experimento {experimento[:2]}..."\n',
                '\tfor i in {1..10}; do\n',
                f'\t\tperf stat -a -x \';\' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time',
                f' ./bin/{experimento} {thread} >/dev/null 2>>"../scripts/{nome_dir}/pstl/{experimento[:2]}-{thread}-threads-pstl-{modelo_cpu}-$horario.csv"\n',
                '\tdone\n'
            ])
            arquivo.write('echo "Experimento concluído"')