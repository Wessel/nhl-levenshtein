namespace LevenshteinRatio;

public static class Levenshtein {
  /// <summary>
  /// Compare <paramref name="target"/> to <paramref name="source"/> using Levenshtein Ratio.
  /// </summary>
  /// <param name="target">The string to compare with <paramref name="source"/>.</param>
  /// <param name="source">The string to compare with <paramref name="target"/>.</param>
  /// <returns>The Levenshtein distance ratio between <paramref name="target"/> and <paramref name="source"/>.</returns>
  /// <example>
  /// <code>
  /// float ratio = Levenshtein.Ratio("exampel", "example");
  /// // ratio => 0.85714287
  /// </code>
  /// </example>
  public static float Ratio(string target, string source) {
    // edge cases: source or target is empty, source equals target
    if (source == target) {
      return 1;
    }

    if (string.IsNullOrEmpty(source) || string.IsNullOrEmpty(target)) {
      return 0;
    }

    // create array to store the distances between each character in the source and target strings
    var distance = new int[source.Length + 1, target.Length + 1];

    // Populate the distance matrix
    for (int i = 0; i <= source.Length; i++) {
      distance[i, 0] = i;
    }

    for (int i = 0; i <= target.Length; i++) {
      distance[0, i] = i;
    }

    // Fill the rows and columns of the distance matrix by comparing the characters in the source 
    // and target strings and calculating the cost (1 if characters are the same)
    for (int i = 1; i <= source.Length; i++) {
      for (int j = 1; j <= target.Length; j++) {
        int cost = target[j - 1] == source[i - 1] ? 0 : 1;

        distance[i, j] = 
          Math.Min(
            Math.Min(
              distance[i - 1, j] + 1, 
              distance[i, j - 1] + 1
            ), 
            distance[i - 1, j - 1] + cost
          );
      }
    }

    // Calculate the ratio of similarity by dividing the distance by the maximum length 
    // of the two strings and subtracting the result from 1.0
    var distanceAsFloat = Convert.ToSingle(distance[source.Length, target.Length]);

    return 1.0f - distanceAsFloat / Math.Max(source.Length, target.Length);
  }
}
