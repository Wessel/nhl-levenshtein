import { levenshteinRatio } from "./levenshteinRatio.ts";

for (let i = 0; i < 1000000; i++) {
  console.log(levenshteinRatio('test', 'kitten'));
}