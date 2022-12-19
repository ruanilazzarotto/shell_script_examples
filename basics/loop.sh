#!/usr/bin/env bash

echo "=== For 1"
for (( i = 0; i < 10; i++)); do
    echo $i
done


echo "=== For 2 (seq)"
for i in $(seq 10); do
    echo $i
done

echo "=== For 3 (array)"
Array=(
'Item1'
'Item2'
'Item3'
'Item4'
)
for i in ${Array[@]}; do
    echo $i
done

echo "=== While"
counter=0
while [[ $counter -lt ${#Array[@]} ]]; do
    echo $counter
    counter=$(($counter+1)) 
done

echo "=== Ex 1"
for (( i = 0; i <= 10; i++)); do
    if [[ `expr $i % 2` == 0 ]]; then
        echo "$i [e divisivel por 2"
    fi
done
