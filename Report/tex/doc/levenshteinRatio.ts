export function levenshteinRatio(target: string, source: string): number {
  if (source === null || target === null) return 0.0;
  if (source === target) return 1.0;
  if (source.length === 0 || target.length === 0) return 0.0;

  const distanceMatrix = new Array(source.length + 1);
  for (let i = 0; i < distanceMatrix.length; i++) distanceMatrix[i] = new Array(target.length + 1);

  for (let i = 0; i <= source.length; distanceMatrix[i][0] = i++);
  for (let i = 0; i <= target.length; distanceMatrix[0][i] = i++);

  for (let i = 1; i <= source.length; i++) {
    for (let j = 1; j <= target.length; j++) {
      const cost = target.charAt(j - 1) === source.charAt(i - 1) ? 0 : 1;

      distanceMatrix[i][j] =
        Math.min(
          Math.min(
            distanceMatrix[i - 1][j] + 1,
            distanceMatrix[i][j - 1] + 1
          ),
          distanceMatrix[i - 1][j - 1] + cost
        );
    }
  }

  const totalDistance = distanceMatrix[source.length][target.length] / Math.max(source.length, target.length);

  return 1.0 - totalDistance;
};
