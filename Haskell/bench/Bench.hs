{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Criterion.Main
import Criterion.Types (Config (..))
import Lib (levenshteinRatio)

main :: IO ()
main =
  defaultMainWith config
    [ bench "levenshteinRatio - short identical strings" $ nf (levenshteinRatio "test") "test",
      bench "levenshteinRatio - short different strings" $ nf (levenshteinRatio "test") "abcd",
      bench "levenshteinRatio - short similar strings" $ nf (levenshteinRatio "kitten") "sitting",
      bench "levenshteinRatio - long identical strings" $ nf (levenshteinRatio longStringA) longStringA,
      bench "levenshteinRatio - long different strings" $ nf (levenshteinRatio longStringA) longStringB,
      bench "levenshteinRatio - long partially similar strings" $ nf (levenshteinRatio longStringC) longStringA
    ]
    where
    config = defaultConfig {reportFile = Just "benchmark.html"}
    longStringA = replicate 1000 'a'
    longStringB = replicate 1000 'b'
    longStringC = replicate 500 'a' ++ replicate 500 'b'
