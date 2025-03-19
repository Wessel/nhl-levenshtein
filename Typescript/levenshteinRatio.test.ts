import { assertEquals } from "jsr:@std/assert";
import { levenshteinRatio } from "./levenshteinRatio.ts";

Deno.test("levenshteinRatio should return 1 for empty strings", () => {
  assertEquals(levenshteinRatio("", ""), 1);
});

Deno.test("levenshteinRatio should return 0 if one string is empty", () => {
  assertEquals(levenshteinRatio("", "test"), 0);
  assertEquals(levenshteinRatio("test", ""), 0);
});

Deno.test("levenshteinRatio should return 0 if one string is null", () => {
  assertEquals(levenshteinRatio("test", null!), 0);
  assertEquals(levenshteinRatio(null!, ""), 0);
  assertEquals(levenshteinRatio(null!, null!), 0);
});

Deno.test("levenshteinRatio should return 1 for identical strings", () => {
  assertEquals(levenshteinRatio("test", "test"), 1);
});

Deno.test("levenshteinRatio should return 1 for long identical strings", () => {
  const longString = new Array(10000).fill('a').join('');
  assertEquals(levenshteinRatio(longString, longString), 1);
});

Deno.test("levenshteinRatio should return 0 for different strings", () => {
  assertEquals(levenshteinRatio("test", "example"), 0);
});

Deno.test("levenshteinRatio should return 0 for long different strings", () => {
  const longStringA = new Array(10000).fill('a').join('');
  const longStringB = new Array(10000).fill('b').join('');
  assertEquals(levenshteinRatio(longStringA, longStringB), 0);
});

Deno.test("levenshteinRatio should return a value between 0 and 1 for similar strings", () => {
  assertEquals(levenshteinRatio("kitten", "sitting"), 0.5714285714285714);
});