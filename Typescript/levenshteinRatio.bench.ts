import { levenshteinRatio } from "./levenshteinRatio.ts";

const longStringA = new Array(1000).fill('a').join('');
const longStringB = new Array(1000).fill('b').join('');
const longStringC = new Array(500).fill('a').join('') + new Array(500).fill('b').join('');

Deno.bench("levenshteinRatio - short identical strings", () => {
  levenshteinRatio("test", "test");
});

Deno.bench("levenshteinRatio - short different strings", () => {
  levenshteinRatio("test", "abcd");
});

Deno.bench("levenshteinRatio - short similar strings", () => {
  levenshteinRatio("kitten", "sitting");
});

Deno.bench("levenshteinRatio - long identical strings", () => {
  levenshteinRatio(longStringA, longStringA);
});

Deno.bench("levenshteinRatio - long different strings", () => {
  levenshteinRatio(longStringA, longStringB);
});

Deno.bench("levenshteinRatio - long partially similar strings", () => {
  levenshteinRatio(longStringC, longStringA);
});
