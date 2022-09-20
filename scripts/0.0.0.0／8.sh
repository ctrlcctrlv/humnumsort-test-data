#!/bin/bash
SEQ=$(seq 0 255)
for i in $SEQ; do
    for j in $SEQ; do
        for k in $SEQ; do
            echo 0.$i.$j.$k
        done
    done
done
