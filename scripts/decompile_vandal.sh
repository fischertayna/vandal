#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <vandal_path> <contractfuzzer_benchmark_path>"
    exit 1
fi

vandal_path=$1
contractfuzzer_benchmark_path=$2
vandal_benchmark_decompile=$PWD/vandal_benchmark_decompile

find "$contractfuzzer_benchmark_path" -type f -name "*.hex" | while read file; do
    relative_path="${file#$contractfuzzer_benchmark_path/}"
    vulnerability="$(echo "$relative_path" | cut -d/ -f1)"
    filename=$(basename "$file" .hex)

    echo "Analyzing $filename"
    echo "vulnerability: $vulnerability"
    specific_folder=$vandal_benchmark_decompile/$vulnerability
    echo "specific_folder: $specific_folder"
    mkdir -p $specific_folder
    cd $specific_folder
    $vandal_path/bin/decompile -n -v -c "remove_unreachable=1" -g $specific_folder/$filename.html  $file
done

