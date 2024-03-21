sh benchmark.sh | tee benchmark-output.txt 
echo "IMAGE_SIZE=$(echo $(cat benchmark-output.txt | tail -2 | head -1 | awk -F: '{print $NF}' | tr -d ' '))" >> $GITHUB_ENV 
echo "BENCHMARK_RESULT=$(echo $(cat benchmark-output.txt | tail -4))" >> $GITHUB_ENV 
echo "BENCHMARK_FINAL_RESULT=$(echo $(cat benchmark-output.txt | tail -1 | awk -F: '{print $NF}' | tr -d ' '))" >> $GITHUB_ENV