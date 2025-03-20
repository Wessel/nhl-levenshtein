using LevenshteinRatio;

for (int i = 0; i < 1000000; i++) {
  Console.WriteLine(i + Levenshtein.Ratio("test", "kitten"));
}
