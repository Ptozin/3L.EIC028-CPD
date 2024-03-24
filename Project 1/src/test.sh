# This file is used to run the tests for the project
# Since it required a lot of time to run all the tests
# And since the CPU Cache is a very important factor
# The program had to be reran in each iteration

# Remove old binary
rm -f matrix 

# Compilation with warning, PAPI and otimization flags
g++ -Wall -o matrix matrixproduct.cpp -O2 -lpapi

# Run tests set
echo "Algorithm 3 - Matrix 10240"
for attemp in {1..4}
do
    ./matrix "3" "10240" "128" "data/data3.txt"
done

for block_size in 256 512
do
    for attemp in {1..5}
    do
        ./matrix "3" "10240" "$block_size" "data/data3.txt"
    done
done