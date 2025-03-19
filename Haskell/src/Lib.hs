module Lib (levenshteinRatio) where

import Data.Array

{-|
  Compare `target` to `source` using LevenshteinRatio

  Arguments:
  * `target` - The string to compare with `source`
  * `source` - The string to compare with `target`

  Returns:
  * The Levenshtein distance between `target` and `source`

  Example:
  > levenshteinRatio "exampel" "example" == 0.7142857142857143
-}
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

    -- create matrix to store the distances between each character in
    -- the source and target strings and populate it
    distanceMatrix = array
      ((0, 0), (sourceLength, targetLength)) -- ((Starting Index), (Ending Index))
      [
        ((i, j), distanceAtIndices i j) | i <- [0 .. sourceLength], 
        j <- [0 .. targetLength]
      ] -- Populate

    -- Base cases and recursive step
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

    -- The final distance (Last element of distanceMatrix)
    finalDistance i j = distanceMatrix ! (i, j)
