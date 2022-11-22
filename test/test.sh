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
./solution test1.in test1.out
./solution_gas test1.in test1_gas.out
./solution test2.in test2.out
./solution_gas test2.in test2_gas.out
./solution test3.in test3.out
./solution_gas test3.in test3_gas.out
./solution test4.in test4.out
./solution_gas test4.in test4_gas.out
./solution test5.in test5.out
./solution_gas test5.in test5_gas.out

echo "++++++++++++++++++Test #1++++++++++++++++++"
cmp -s test1_gas.out test1.out && echo Равны
echo "++++++++++++++++++Test #2++++++++++++++++++"
cmp -s test2_gas.out test2.out && echo Равны
echo "++++++++++++++++++Test #3++++++++++++++++++"
cmp -s test3_gas.out test3.out && echo Равны
echo "++++++++++++++++++Test #4++++++++++++++++++"
cmp -s test4_gas.out test4.out && echo Равны
echo "++++++++++++++++++Test #5++++++++++++++++++"
cmp -s test5_gas.out test5.out && echo Равны
