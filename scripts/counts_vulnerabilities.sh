#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <resulting_analysis_folder_path>"
    exit 1
fi

resulting_analysis_folder_path=$1

blockNumberDependencyCount=0
dangerousDelegateCallCount=0
timestampDependencyCount=0

while IFS= read -r file; do
  size=$(wc -c < "$file")
  filename=$(basename "$file" .csv)
  case "$filename" in
    blockNumberDependency) [ "$size" -gt 0 ] && ((blockNumberDependencyCount++));;
    dangerousDelegateCall) [ "$size" -gt 0 ] && ((dangerousDelegateCallCount++));;
    timestampDependency) [ "$size" -gt 0 ] && ((timestampDependencyCount++));;
  esac
done < <(find "$resulting_analysis_folder_path" -type f -name "*.csv")

echo "blockNumberDependency: $blockNumberDependencyCount"
echo "dangerousDelegateCall: $dangerousDelegateCallCount"
echo "timestampDependency: $timestampDependencyCount"