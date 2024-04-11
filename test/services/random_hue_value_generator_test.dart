import 'package:color_generator/services/random_hue_value_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RandomHueValueGenerator', () {
    // Test to verify that generateRandomHue generates
    // a value between 0 and 360.
    test('generateRandomHue generates a value between 0 and 360', () {
      final generator = RandomHueValueGenerator();
      const double maxHueNumber = 360.0;
      final hue = generator.generateRandomHue();

      // Verify that the generated hue value is greater than or equal to 0.
      expect(hue, greaterThanOrEqualTo(0.0));
      // Verify that the generated hue value is less than or equal to 360.
      expect(hue, lessThanOrEqualTo(maxHueNumber));
    });

    // Test to verify that generateRandomHue generates
    // different values on subsequent calls.
    test(
      'generateRandomHue generates different values on subsequent calls',
      () {
        final generator = RandomHueValueGenerator();
        // Generate hue values twice and ensure they are not equal.
        final hue1 = generator.generateRandomHue();
        final hue2 = generator.generateRandomHue();
        // Verify that the hue values generated on subsequent calls
        // are different.
        expect(hue1, isNot(equals(hue2)));
      },
    );
  });
}
