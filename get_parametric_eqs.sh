#!/bin/bash

for file in ./results/*/*ParametricEQ.txt; do
    result_dir=$(dirname "$file")
    dest_name=$(echo "$result_dir" | cut -d'/' -f3-)
    dest_file="${dest_name}.csv"
    echo "Getting '$dest_file'"
    cp "$file" "./parametric_eqs/$dest_file"
done;