rm deno-bench.json perf.data perf.data.txt

sudo perf record -F MAX -g /home/wessel/Desktop/functional/Haskell/levenshteinRatio/.stack-work/dist/x86_64-linux/ghc-9.8.4/build/levenshteinRatio-bench/levenshteinRatio-bench 
sudo chown $USER:$USER ./perf.data
perf script -i perf.data > perf.data.txt
