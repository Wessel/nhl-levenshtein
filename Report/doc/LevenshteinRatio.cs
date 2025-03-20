namespace LevenshteinRatio;

public static class Levenshtein {
  public static float Ratio(string target, string source) {
    if (source == target) {
      return 1;
    }

    if (string.IsNullOrEmpty(source) || string.IsNullOrEmpty(target)) {
      return 0;
    }

    var distance = new int[source.Length + 1, target.Length + 1];

    for (int i = 0; i <= source.Length; i++) {
      distance[i, 0] = i;
    }

    for (int i = 0; i <= target.Length; i++) {
      distance[0, i] = i;
    }

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

    var distanceAsFloat = Convert.ToSingle(distance[source.Length, target.Length]);

    return 1.0f - distanceAsFloat / Math.Max(source.Length, target.Length);
  }
}
