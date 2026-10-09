import subprocess

nome_dir = input("Digite o nome do diretório onde quer armazenar o script do experimento:")
subprocess.run(['mkdir',f'{nome_dir}',f'{nome_dir}/sequencial',f'{nome_dir}/fastflow',f'{nome_dir}/openmp',f'{nome_dir}/onetbb',f'{nome_dir}/pstl'])

n = int(subprocess.run("nproc",  capture_output=True).stdout)
lista_threads = [1]
for i in range(2, n+1, 2):
    lista_threads.append(i)
lista_experimentos = ['cg','ep','ft','is','mg']

maquina = subprocess.run(["hostname"], capture_output=True).stdout.decode('utf-8').strip()

subprocess.run(['cd', 'NPB-SER/'], shell=True)
for experimento in lista_experimentos:
    subprocess.run(["make", f'{experimento} CLASS=S'])

subprocess.run(['cd', '../NPB-FF/'], shell=True)
for experimento in lista_experimentos:
    subprocess.run(["make", f'{experimento} CLASS=S'])

subprocess.run(['cd', '../NPB-OMP/'], shell=True)
for experimento in lista_experimentos:
    subprocess.run(["make", f'{experimento} CLASS=S'])

subprocess.run(['cd', '../NPB-TBB/'], shell=True)
for experimento in lista_experimentos:
    subprocess.run(["make", f'{experimento} CLASS=S'])

subprocess.run(['cd', '../NPB-PSTL/'], shell=True)
for experimento in lista_experimentos:
    subprocess.run(["make", f'{experimento} CLASS=S'])

'''
with open(file=f'{nome_dir}/experimento.sh', mode='w') as arquivo:
    arquivo.write('#!/bin/bash\n')
    
    arquivo.write('source libs/tbb-2020.1/build/linux_intel64_gcc_cc15.2.0_libc2.43_kernel7.0.0_release/tbbvars.sh \n')
    arquivo.write('cd NPB-SER/\n')
    
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        arquivo.writelines([
            f'echo "Iniciando experimento {experimento}..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tperf stat -a -x \';\' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time', 
            f' ./bin/{experimento} >/dev/null 2>>"../scripts/{nome_dir}/sequencial/{experimento}-{maquina}-$horario.csv"\n',
            '\tdone\n'])
        arquivo.write('echo "Experimento concluído"\n\n')
    arquivo.write('cd ../NPB-FF/\n')
    
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento}..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tenv FF_NUM_THREADS={thread} perf stat -a -x \';\' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time',
            f' ./bin/{experimento} >/dev/null 2>>"../scripts/{nome_dir}/fastflow/{experimento}-{thread}-threads-ff-{maquina}-$horario.csv"\n',
            '\tdone\n'])
            arquivo.write('echo "Experimento concluído"\n\n')
    arquivo.write('cd ../NPB-OMP/\n')
    
    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento}..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tenv OMP_NUM_THREADS={thread} perf stat -a -x \';\' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time', 
            f' ./bin/{experimento} >/dev/null 2>>"../scripts/{nome_dir}/openmp/{experimento}-{thread}-threads-omp-{maquina}-$horario.csv"\n',
            '\tdone\n'])
            arquivo.write('echo "Experimento concluído"\n\n')
    arquivo.write('cd ../NPB-TBB/\n')

    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
            f'echo "Iniciando experimento {experimento}..."\n',
            '\tfor i in {1..10}; do\n',
            f'\t\tenv TBB_NUM_THREADS={thread} perf stat -a -x \';\' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time', 
            f' ./bin/{experimento} >/dev/null 2>>"../scripts/{nome_dir}/onetbb/{experimento}-{thread}-threads-tbb-{maquina}-$horario.csv"\n',
            '\tdone\n'])
            arquivo.write('echo "Experimento concluído"\n\n')
    
    arquivo.write('cd ../NPB-PSTL/\n')

    for experimento in lista_experimentos:
        arquivo.write('horario=$(date +%T)\n')
        for thread in lista_threads:
            arquivo.writelines([
                f'echo "Iniciando experimento {experimento}..."\n',
                '\tfor i in {1..10}; do\n',
                f'\t\tperf stat -a -x \';\' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time',
                f' ./bin/{experimento} {thread} >/dev/null 2>>"../scripts/{nome_dir}/pstl/{experimento}-{thread}-threads-pstl-{maquina}-$horario.csv"\n',
                '\tdone\n'
            ])
            arquivo.write('echo "Experimento concluído"\n\n')'''