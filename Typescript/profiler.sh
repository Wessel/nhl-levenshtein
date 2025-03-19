rm deno-bench.json perf.data perf.data.txt

sudo perf record -F MAX -g /home/wessel/.deno/bin/deno bench --json > deno-bench.json
sudo chown $USER:$USER ./perf.data
perf script -i perf.data > perf.data.txt
