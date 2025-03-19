namespace LevenshteinRatio.Tests;

using Xunit;
using LevenshteinRatio;

public class UnitTest1Test
{
  [Fact]
  public void Test_LevenshteinRatio_EqualStrings()
  {
    // Arrange
    string str1 = "test";
    string str2 = "test";
    double expectedRatio = 1.0;

    // Act
    double actualRatio = Levenshtein.Ratio(str1, str2);

    // Assert
    Assert.Equal(expectedRatio, actualRatio);
  }

  [Fact]
  public void Test_LevenshteinRatio_CompletelyDifferentStrings()
  {
    // Arrange
    string str1 = "test";
    string str2 = "abcd";
    double expectedRatio = 0.0;

    // Act
    double actualRatio = Levenshtein.Ratio(str1, str2);

    // Assert
    Assert.Equal(expectedRatio, actualRatio);
  }

  [Fact]
  public void Test_LevenshteinRatio_SimilarStrings()
  {
    // Arrange
    string str1 = "kitten";
    string str2 = "sitting";
    double expectedRatio = 0.5714285714285714; // Example ratio

    // Act
    double actualRatio = Levenshtein.Ratio(str1, str2);

    // Assert
    Assert.Equal(expectedRatio, actualRatio, 5);
  }

  [Fact]
  public void Test_LevenshteinRatio_EmptyStrings()
  {
    // Arrange
    string str1 = "";
    string str2 = "";
    double expectedRatio = 1.0;

    // Act
    double actualRatio = Levenshtein.Ratio(str1, str2);

    // Assert
    Assert.Equal(expectedRatio, actualRatio);
  }

  [Fact]
  public void Test_LevenshteinRatio_OneEmptyString()
  {
    // Arrange
    string str1 = "test";
    string str2 = "";
    double expectedRatio = 0.0;

    // Act
    double actualRatio = Levenshtein.Ratio(str1, str2);

    // Assert
    Assert.Equal(expectedRatio, actualRatio);
  }
}