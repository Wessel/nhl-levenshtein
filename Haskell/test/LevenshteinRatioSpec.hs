module LevenshteinRatioSpec (main, spec) where

import Lib (levenshteinRatio)
import SpecHelper

spec :: Spec
spec = 
  describe "levenshteinRatio" $ do
    it "should return 1 for two empty strings" $ do
      levenshteinRatio "" "" `shouldBe` 1.0

    it "should return 0 if one string is empty" $ do
      levenshteinRatio "" "test" `shouldBe` 0.0
      levenshteinRatio "test" "" `shouldBe` 0.0

    it "should return 0 for completely different strings" $ do
      levenshteinRatio "test" "example" `shouldBe` 0.0

    it "should return 0 for long different strings" $ do
      levenshteinRatio longStringA longStringB `shouldBe` 0.0

    it "should return a value between 0 and 1 for similar strings" $ do
      levenshteinRatio "kitten" "sitting" `shouldBe` 0.5714285714285714

    it "should return 0.5 for long 50/50 similar strings" $ do
      levenshteinRatio longStringA longStringC `shouldBe` 0.5

    it "should return 1 for identical strings" $ do
      levenshteinRatio "test" "test" `shouldBe` 1.0

    it "should return 1 for long identical strings" $ do
      levenshteinRatio longStringA longStringA `shouldBe` 1.0
  where
    longStringA = replicate 1000 'a' 
    longStringB = replicate 1000 'b'
    longStringC = replicate 500 'a' ++ replicate 500 'b'

main :: IO ()
main = hspec spec