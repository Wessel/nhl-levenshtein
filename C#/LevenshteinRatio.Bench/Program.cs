using System;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Exporters;
using BenchmarkDotNet.Running;
using LevenshteinRatio;
using BenchmarkDotNet.Exporters.Json;

[PerfCollectProfiler]
public class LevenshteinBenchmark
{
  private static readonly string LongStringA = new string('a', 1000);
  private static readonly string LongStringB = new string('b', 1000);
  private static readonly string LongStringC = new string('a', 500) + new string('b', 500);

  [Benchmark]
  public void ShortIdenticalStrings() => Levenshtein.Ratio("test", "test");

  [Benchmark]
  public void ShortDifferentStrings() => Levenshtein.Ratio("test", "abcd");

  [Benchmark]
  public void ShortSimilarStrings() => Levenshtein.Ratio("kitten", "sitting");

  [Benchmark]
  public void LongIdenticalStrings() => Levenshtein.Ratio(LongStringA, LongStringA);

  [Benchmark]
  public void LongDifferentStrings() => Levenshtein.Ratio(LongStringA, LongStringB);

  [Benchmark]
  public void LongPartiallySimilarStrings() => Levenshtein.Ratio(LongStringC, LongStringA);

  public static void Main(string[] args) {
    var config = ManualConfig
      .Create(DefaultConfig.Instance);
      .AddExporter(MarkdownExporter.GitHub)
      .AddExporter(JsonExporter.Full)
      .AddExporter(JsonExporter.Brief)
      .WithArtifactsPath(@"./res");

    var summary = BenchmarkRunner.Run<LevenshteinBenchmark>(config);
  }
}
