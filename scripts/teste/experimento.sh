#!/bin/bash
source libs/tbb-2020.1/build/linux_intel64_gcc_cc15.2.0_libc2.43_kernel7.0.0_release/tbbvars.sh 
cd NPB-SER/
horario=$(date +%T)
echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/sequencial/medicao-energetica-cg-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/sequencial/medicao-energetica-ep-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/sequencial/medicao-energetica-ft-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/sequencial/medicao-energetica-is-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/sequencial/medicao-energetica-mg-$horario.csv"
	done
echo "Experimento concluído"

cd ../NPB-FF/
horario=$(date +%T)
echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-1-threads-ff-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-2-threads-ff-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-4-threads-ff-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-6-threads-ff-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-8-threads-ff-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-10-threads-ff-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-12-threads-ff-cg-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-1-threads-ff-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-2-threads-ff-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-4-threads-ff-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-6-threads-ff-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-8-threads-ff-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-10-threads-ff-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-12-threads-ff-ep-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-1-threads-ff-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-2-threads-ff-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-4-threads-ff-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-6-threads-ff-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-8-threads-ff-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-10-threads-ff-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-12-threads-ff-ft-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-1-threads-ff-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-2-threads-ff-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-4-threads-ff-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-6-threads-ff-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-8-threads-ff-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-10-threads-ff-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-12-threads-ff-is-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-1-threads-ff-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-2-threads-ff-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-4-threads-ff-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-6-threads-ff-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-8-threads-ff-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-10-threads-ff-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env FF_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/fastflow/medicao-energetica-12-threads-ff-mg-$horario.csv"
	done
echo "Experimento concluído"

cd ../NPB-OMP/
horario=$(date +%T)
echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-1-threads-omp-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-2-threads-omp-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-4-threads-omp-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-6-threads-omp-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-8-threads-omp-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-10-threads-omp-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-12-threads-omp-cg-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-1-threads-omp-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-2-threads-omp-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-4-threads-omp-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-6-threads-omp-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-8-threads-omp-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-10-threads-omp-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-12-threads-omp-ep-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-1-threads-omp-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-2-threads-omp-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-4-threads-omp-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-6-threads-omp-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-8-threads-omp-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-10-threads-omp-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-12-threads-omp-ft-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-1-threads-omp-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-2-threads-omp-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-4-threads-omp-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-6-threads-omp-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-8-threads-omp-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-10-threads-omp-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-12-threads-omp-is-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-1-threads-omp-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-2-threads-omp-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-4-threads-omp-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-6-threads-omp-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-8-threads-omp-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-10-threads-omp-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env OMP_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/openmp/medicao-energetica-12-threads-omp-mg-$horario.csv"
	done
echo "Experimento concluído"

cd ../NPB-TBB/
horario=$(date +%T)
echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-1-threads-tbb-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-2-threads-tbb-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-4-threads-tbb-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-6-threads-tbb-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-8-threads-tbb-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-10-threads-tbb-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-12-threads-tbb-cg-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-1-threads-tbb-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-2-threads-tbb-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-4-threads-tbb-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-6-threads-tbb-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-8-threads-tbb-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-10-threads-tbb-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-12-threads-tbb-ep-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-1-threads-tbb-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-2-threads-tbb-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-4-threads-tbb-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-6-threads-tbb-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-8-threads-tbb-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-10-threads-tbb-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-12-threads-tbb-ft-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-1-threads-tbb-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-2-threads-tbb-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-4-threads-tbb-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-6-threads-tbb-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-8-threads-tbb-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-10-threads-tbb-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-12-threads-tbb-is-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=1 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-1-threads-tbb-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=2 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-2-threads-tbb-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=4 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-4-threads-tbb-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=6 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-6-threads-tbb-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=8 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-8-threads-tbb-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=10 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-10-threads-tbb-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		env TBB_NUM_THREADS=12 perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S >/dev/null 2>>"../scripts/teste/onetbb/medicao-energetica-12-threads-tbb-mg-$horario.csv"
	done
echo "Experimento concluído"

cd ../NPB-PSTL/
horario=$(date +%T)
echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S 1 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-1-threads-pstl-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S 2 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-2-threads-pstl-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S 4 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-4-threads-pstl-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S 6 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-6-threads-pstl-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S 8 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-8-threads-pstl-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S 10 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-10-threads-pstl-cg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento cg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/cg.S 12 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-12-threads-pstl-cg-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S 1 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-1-threads-pstl-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S 2 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-2-threads-pstl-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S 4 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-4-threads-pstl-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S 6 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-6-threads-pstl-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S 8 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-8-threads-pstl-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S 10 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-10-threads-pstl-ep-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ep.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ep.S 12 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-12-threads-pstl-ep-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S 1 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-1-threads-pstl-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S 2 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-2-threads-pstl-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S 4 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-4-threads-pstl-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S 6 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-6-threads-pstl-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S 8 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-8-threads-pstl-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S 10 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-10-threads-pstl-ft-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento ft.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/ft.S 12 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-12-threads-pstl-ft-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S 1 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-1-threads-pstl-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S 2 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-2-threads-pstl-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S 4 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-4-threads-pstl-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S 6 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-6-threads-pstl-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S 8 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-8-threads-pstl-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S 10 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-10-threads-pstl-is-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento is.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/is.S 12 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-12-threads-pstl-is-$horario.csv"
	done
echo "Experimento concluído"

horario=$(date +%T)
echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S 1 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-1-threads-pstl-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S 2 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-2-threads-pstl-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S 4 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-4-threads-pstl-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S 6 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-6-threads-pstl-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S 8 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-8-threads-pstl-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S 10 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-10-threads-pstl-mg-$horario.csv"
	done
echo "Experimento concluído"

echo "Iniciando experimento mg.S..."
	for i in {1..10}; do
		perf stat -a -x ';' -e power_core/energy-core/,power/energy-pkg/,system_time,user_time,duration_time ./bin/mg.S 12 >/dev/null 2>>"../scripts/teste/pstl/medicao-energetica-12-threads-pstl-mg-$horario.csv"
	done
echo "Experimento concluído"

