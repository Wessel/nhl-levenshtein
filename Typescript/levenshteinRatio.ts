/**
 * Compare `target` to `source` using LevenshteinRatio
 *
 * @param {string} target The string to compare with `source`
 * @param {string} source The string to compare with `target`
 * @returns {number} The Levenshtein distance between `target` and `source`
 * @example
 *
 * levenshteinRatio('exampel', 'example')
 * // => 0.7142857142857143
 */
export function levenshteinRatio(target: string, source: string): number {
  // edge cases: source or target is empty, source equals target
  if (source === null || target === null) return 0.0;
  if (source === target) return 1.0;
  if (source.length === 0 || target.length === 0) return 0.0;

  // create matrix to store the distances between each character in
  // the source and target strings and populate it
  const distanceMatrix = new Array(source.length + 1);
  for (let i = 0; i < distanceMatrix.length; i++) distanceMatrix[i] = new Array(target.length + 1);

  for (let i = 0; i <= source.length; distanceMatrix[i][0] = i++);
  for (let i = 0; i <= target.length; distanceMatrix[0][i] = i++);

  // Fill the rows and columns of the distance matrix by comparing the characters in the source
  // and target strings and calculating the cost (1 if characters are the same)
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

  // Calculate the ratio of similarity by dividing the distance by the maximum length 
  // of the two strings and subtracting the result from 1.0
  const totalDistance = distanceMatrix[source.length][target.length] / Math.max(source.length, target.length);

  return 1.0 - totalDistance;
};