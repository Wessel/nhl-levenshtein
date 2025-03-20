-- module Main where

import Lib (levenshteinRatio)
import Text.Format

main :: IO ()
main = do
  repeatNTimes
    1000000
    (putStrLn
      (format "{0}" [show (levenshteinRatio "test" "kitten")])
    )
  where
    repeatNTimes 0 _ = return ()
    repeatNTimes n action = do
      action
      repeatNTimes (n-1) action