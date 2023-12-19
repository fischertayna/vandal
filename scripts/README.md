# Scripts

This folder contains the following scripts:

## Compile ContractFuzzer Benchmark
p;
Made to compille ContractFuzzer Benchmark in order to obtain the hex files.
They are necessary in order to usem them as input for Vandal.

Usage: compile_benchmark.sh <contractfuzzer_examples_folder_path>

## Decompile using Vandal

Decompile ContractFuzzer benchmark using Vandal.
Genarates CFGs. Useful for manual analysis.

Usage: decompile_vandal.sh <vandal_path> <contractfuzzer_benchmark_path>

## Execute (analyse) Vandal

Analyse ContractFuzzer benchmark using Vandal.
This script uses the new analysis file.

Usage: decompile_vandal.sh <vandal_path> <contractfuzzer_benchmark_path>

## Counts vulnerabilities

Counts how many vulnerabilities of each new type are in the benchmark.

Usage: counts_vulnerabilities.sh <resulting_analysis_folder_path>
