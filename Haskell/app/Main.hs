-- module Main where

import Lib (levenshteinRatio)
import Text.Format

main :: IO ()
main = do
  let source = "kitten"
      target = "sitting"

  putStrLn $ format "Source\t{0}" [source]
  putStrLn $ format "Target\t{0}" [target]
  putStrLn $ format "Ratio\t{0}" [show (levenshteinRatio source target)]
