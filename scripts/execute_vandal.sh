#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <vandal_path> <contractfuzzer_benchmark_path>"
    exit 1
fi

vandal_path=$1
contractfuzzer_benchmark_path=$2
analysis_path=$PWD/vandal-benchmark-analyses

find "$contractfuzzer_benchmark_path" -type f -name "*.hex" | while read file; do
    relative_path="${file#$contractfuzzer_benchmark_path/}"
    vulnerability="$(echo "$relative_path" | cut -d/ -f1)"
    filename=$(basename "$file" .hex)

    echo "Analisando $filename"
    echo "vulnerability: $vulnerability"
    mkdir -p $analysis_path/$vulnerability/$filename
    cd $analysis_path/$vulnerability/$filename
    $vandal_path/bin/analyze.sh $file $vandal_path/datalog/new_analyses.dl
done

