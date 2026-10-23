import subprocess
import json
import os
import glob

# solicita o nome da pasta para armazenar os resultados
nome_dir = input("Digite o nome do diretório para armazenar o experimento: ").strip()

# cria a pasta principal e as subpastas separando as implementações
subpastas = ['sequencial', 'fastflow', 'openmp', 'onetbb', 'pstl']
for sub in subpastas:
    os.makedirs(f'{nome_dir}/{sub}', exist_ok=True)

# obtendo o número de threads disponíveis na máquina
n = int(subprocess.run("nproc",  capture_output=True, text=True).stdout)
lista_threads = [1]
for i in range(2, n+1, 2):
    lista_threads.append(i)

# obtendo o nome do processador da máquina
lscpu_str = subprocess.run(['lscpu', '-J'], capture_output=True, text=True).stdout
lscpu_dict = json.loads(lscpu_str)
modelo_cpu = "CPU-n-identificada"
for item in lscpu_dict['lscpu']:
    if item['field'] in ('Model name:', 'Nome do modelo:'):
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

# obtendo o caminho da pasta onde estão armazenadas as variáveis de ambiente do Intel TBB (é necessário rodar o comando make na pasta da biblioteca TBB previamente)
busca_tbb_vars = glob.glob(f'{os.getcwd()}/libs/tbb-2020.1/build/linux_intel*/tbbvars.sh')
if busca_tbb_vars:
    caminho_tbb_vars = busca_tbb_vars[0]
else:
    raise FileNotFoundError(
        "\n[ERRO] O arquivo 'tbbvars.sh' não foi encontrado!\n"
        "Certifique-se de ter executado 'make' dentro da pasta 'libs/tbb-2020.1/' "
        "antes de rodar o gera-shell.py.")


# criando a lista de experimentos e as pastas que serão acessadas na compilação dos programas
lista_experimentos = [f'cg.{classe}', f'ep.{classe}', f'ft.{classe}', f'is.{classe}', f'mg.{classe}']
pastas = ['NPB-SER','../NPB-FF','../NPB-OMP','../NPB-TBB','../NPB-PSTL']

# criando o script do experimento
with open(file=f'scripts/roda-experimento.sh', mode='w') as arquivo:
    # Adicionando o cabeçalho do script
    arquivo.write('#!/bin/bash\n')

    # Carregando variáveis de ambiente do Intel TBB
    arquivo.write(f'source {caminho_tbb_vars}\n')

    # Compilando os programas
    for pasta in pastas:
        arquivo.write(f'cd {pasta}/\n')
        for experimento in lista_experimentos:
            arquivo.write(f'make {experimento[:2]} CLASS={classe}\n')
    arquivo.write('cd ../\n')
    arquivo.write('cd NPB-SER/\n')

    # Executando os experimentos
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        arquivo.writelines([
            f'echo "Iniciando experimento {experimento[:2]} sequencial..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tperf stat -a -x \';\' -e {",".join(eventos)},system_time,user_time,duration_time', 
            f' ./bin/{experimento} >/dev/null 2>>"../{nome_dir}/sequencial/{experimento[:2]}-{classe}-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'])
        arquivo.write('echo "Experimento concluído"\n\n')
    
    arquivo.write('cd ../NPB-FF/\n')
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento[:2]} Fastflow {thread} threads..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tenv FF_NUM_THREADS={thread} perf stat -a -x \';\' -e {",".join(eventos)},system_time,user_time,duration_time',
            f' ./bin/{experimento} >/dev/null 2>>"../{nome_dir}/fastflow/{experimento[:2]}-{classe}-{thread}-threads-ff-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'])
            arquivo.write('echo "Experimento concluído"\n\n')
    
    arquivo.write('cd ../NPB-OMP/\n')
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento[:2]} OpenMP {thread} threads..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tenv OMP_NUM_THREADS={thread} perf stat -a -x \';\' -e {",".join(eventos)},system_time,user_time,duration_time', 
            f' ./bin/{experimento} >/dev/null 2>>"../{nome_dir}/openmp/{experimento[:2]}-{classe}-{thread}-threads-omp-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'])
            arquivo.write('echo "Experimento concluído"\n\n')
    
    arquivo.write('cd ../NPB-TBB/\n')
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento[:2]} OneTBB {thread} threads..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tenv TBB_NUM_THREADS={thread} perf stat -a -x \';\' -e {",".join(eventos)},system_time,user_time,duration_time', 
            f' ./bin/{experimento} >/dev/null 2>>"../{nome_dir}/onetbb/{experimento[:2]}-{classe}-{thread}-threads-tbb-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'])
            arquivo.write('echo "Experimento concluído"\n\n')

    arquivo.write('cd ../NPB-PSTL/\n')
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento[:2]} PSTL {thread} threads..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tperf stat -a -x \';\' -e {",".join(eventos)},system_time,user_time,duration_time',
            f' ./bin/{experimento} {thread} >/dev/null 2>>"../{nome_dir}/pstl/{experimento[:2]}-{classe}-{thread}-threads-pstl-{modelo_cpu}-$horario.csv"\n',
            '\tdone\n'
            ])
            arquivo.write('echo "Experimento concluído"\n\n')