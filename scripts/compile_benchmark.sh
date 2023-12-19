#!/bin/bash

# This script was made to compile contract fuzzer benchmark (examples folder). 
# You may have to make some changes to use it with other benchmarks

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <contractfuzzer_examples_folder_path>"
    exit 1
fi

# ContractFuzzer Examples folder
examples_folder=$1

find "$examples_folder" -type f \( -name "*.sol" -o -type f -a ! -name "*.*" \) | while read file; do
    relative_path="${file#$examples_folder/}"
    vulnerability="$(echo "$relative_path" | cut -d/ -f1)"
    nome_file=$(basename "$file" .sol)

    echo "Compiling $nome_file..."
    echo "vulnerability: $vulnerability"
    mkdir -p contractfuzzer-benchmark/$vulnerability
    solc --bin-runtime $file | tail -n 1 > contractfuzzer-benchmark/$vulnerability/$nome_file.hex
done

