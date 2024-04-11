import 'dart:math';

/// A utility class for generating random hue value.
class RandomHueValueGenerator {
  /// Generates a random hue value between 0 and 360.
  ///
  /// Returns a random double value representing the hue component of an HSV
  /// color, ranging from 0.0 (inclusive) to 360.0 (inclusive).
  double generateRandomHue() {
    final random = Random();
    const int maxHueNumber = 360;

    return random.nextInt(maxHueNumber + 1).toDouble();
  }
}
