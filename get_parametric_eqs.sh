#!/bin/bash
set -e

for file in ./results/*/*ParametricEQ.txt; do
    filename=$(basename "$file")
    result_dir=$(dirname "$file")
    dest_name=$(echo "$result_dir" | cut -d'/' -f3-)
    dest_file="${dest_name}.txt"
    model_name=$(echo "$filename" | sed -e "s/ ParametricEQ.txt$//")

    if [ ! -d "./parametric_eqs/$model_name" ]; then
        mkdir "./parametric_eqs/$model_name"
    fi

    echo "Getting '$dest_file'"
    cp "$file" "./parametric_eqs/$model_name/$dest_file"
done;