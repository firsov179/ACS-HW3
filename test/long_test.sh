cd ..
cd C
gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables  -fcf-protection=none solution.c
gcc -c solution.s solution.o
gcc solution.o -o ../test/solution
cd ..
cd Gas
gcc -c solution_gas.s solution_gas.o
gcc solution_gas.o -o ../test/solution_gas
cd ..
cd test

time ./solution test1.in test1.out long
time ./solution_gas test1.in test1_gas.out long