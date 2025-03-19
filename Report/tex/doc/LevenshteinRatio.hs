module Lib (levenshteinRatio) where

import Data.Array

levenshteinRatio :: String -> String -> Double
levenshteinRatio source target
  | source == target = 1.0
  | otherwise =
      let distance  = fromIntegral (calculateDistance source target)
          maxLength = fromIntegral (max (length source) (length target))
      in 1.0 - distance / maxLength

calculateDistance :: String -> String -> Int
calculateDistance source target = finalDistance sourceLength targetLength
  where
    sourceLength = length source
    targetLength = length target

    distanceMatrix = array
      ((0, 0), (sourceLength, targetLength))
      [
        ((i, j), distanceAtIndices i j) | i <- [0 .. sourceLength],
        j <- [0 .. targetLength]
      ]

    distanceAtIndices 0 j = j
    distanceAtIndices i 0 = i
    distanceAtIndices i j =
      minimum
        [ distanceMatrix ! (i - 1, j) + 1,
          distanceMatrix ! (i, j - 1) + 1,
          distanceMatrix ! (i - 1, j - 1) + cost i j
        ]

    cost i j
      | source !! (i - 1) == target !! (j - 1) = 0
      | otherwise = 1

    finalDistance i j = distanceMatrix ! (i, j)
