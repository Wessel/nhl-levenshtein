```

BenchmarkDotNet v0.14.0, Debian GNU/Linux 12 (bookworm) (container)
AMD Ryzen 5 5600X, 1 CPU, 12 logical and 6 physical cores
.NET SDK 9.0.201
  [Host]     : .NET 9.0.3 (9.0.325.11113), X64 RyuJIT AVX2
  DefaultJob : .NET 9.0.3 (9.0.325.11113), X64 RyuJIT AVX2


```
| Method                      | Mean             | Error          | StdDev         |
|---------------------------- |-----------------:|---------------:|---------------:|
| ShortIdenticalStrings       |         1.410 ns |      0.0510 ns |      0.0793 ns |
| ShortDifferentStrings       |       112.147 ns |      1.4472 ns |      1.3537 ns |
| ShortSimilarStrings         |       193.013 ns |      1.8653 ns |      1.7448 ns |
| LongIdenticalStrings        |         1.097 ns |      0.0221 ns |      0.0196 ns |
| LongDifferentStrings        | 3,234,542.032 ns | 34,662.1297 ns | 32,422.9776 ns |
| LongPartiallySimilarStrings | 3,233,473.960 ns | 18,980.6706 ns | 16,825.8701 ns |
