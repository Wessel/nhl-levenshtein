```

BenchmarkDotNet v0.14.0, Ubuntu 24.04.2 LTS (Noble Numbat)
11th Gen Intel Core i5-1135G7 2.40GHz, 1 CPU, 8 logical and 4 physical cores
.NET SDK 9.0.202
  [Host]     : .NET 9.0.3 (9.0.325.11113), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI
  DefaultJob : .NET 9.0.3 (9.0.325.11113), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI


```
| Method                      | Mean             | Error          | StdDev        |
|---------------------------- |-----------------:|---------------:|--------------:|
| ShortIdenticalStrings       |         1.312 ns |      0.0004 ns |     0.0003 ns |
| ShortDifferentStrings       |       103.049 ns |      0.0674 ns |     0.0563 ns |
| ShortSimilarStrings         |       194.641 ns |      0.0788 ns |     0.0658 ns |
| LongIdenticalStrings        |         1.326 ns |      0.0015 ns |     0.0013 ns |
| LongDifferentStrings        | 4,223,805.344 ns |  5,261.4891 ns | 4,664.1730 ns |
| LongPartiallySimilarStrings | 4,247,203.544 ns | 10,246.9063 ns | 9,584.9625 ns |
