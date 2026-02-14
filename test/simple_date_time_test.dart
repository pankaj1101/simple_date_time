import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:simple_date_time/simple_date_time.dart';

void main() {
  group('SimpleDateTime.formatStringDateTime', () {
    test('formats string date with date preset only', () {
      final result = SimpleDateTime.formatStringDateTime(
        date: '2025-11-18 22:30:45.000',
        dateFormatPreset: SimpleDateFormat.ddMMMyyyy,
      );

      expect(result, '18 Nov 2025');
    });

    test('formats string date with date and time preset', () {
      final result = SimpleDateTime.formatStringDateTime(
        date: '2025-11-18 22:30:45.000',
        dateFormatPreset: SimpleDateFormat.ddMMMyyyy,
        timeFormatPreset: SimpleTimeFormat.hhMmAmPm,
        includeTime: true,
      );

      expect(result, '18 Nov 2025 10:30 PM');
    });

    test('returns empty string for null input', () {
      final result = SimpleDateTime.formatStringDateTime(date: null);
      expect(result, '');
    });

    test('returns empty string for invalid string', () {
      final result = SimpleDateTime.formatStringDateTime(date: 'invalid-date');
      expect(result, '');
    });
  });

  group('SimpleDateTime.formatDateTime', () {
    test('formats DateTime with date preset', () {
      Intl.defaultLocale = 'en_US';

      final date = DateTime(2025, 11, 18, 22, 30);

      final result = SimpleDateTime.formatDateTime(
        dateTime: date,
        dateFormatPreset: SimpleDateFormat.ddMMMyyyy,
        toLocal: false,
      );

      expect(result, '18 Nov 2025');
    });

    test('formats DateTime with date and time preset', () {
      final date = DateTime(2025, 11, 18, 22, 30);

      final result = SimpleDateTime.formatDateTime(
        dateTime: date,
        dateFormatPreset: SimpleDateFormat.ddMMMyyyy,
        timeFormatPreset: SimpleTimeFormat.hhMmAmPm,
        includeTime: true,
        toLocal: false,
      );

      expect(result, '18 Nov 2025 10:30 PM');
    });
  });

  group('SimpleDateTime.toDateTime', () {
    test('parses string to DateTime successfully', () {
      final result = SimpleDateTime.toDateTime(
        date: '18-11-2025',
        inputFormat: 'dd-MM-yyyy',
        toLocal: false,
      );

      expect(result, isNotNull);
      expect(result!.year, 2025);
      expect(result.month, 11);
      expect(result.day, 18);
    });

    test('returns null for invalid date string', () {
      final result = SimpleDateTime.toDateTime(
        date: 'invalid',
        inputFormat: 'dd-MM-yyyy',
      );

      expect(result, isNull);
    });

    test('returns null for mismatched format', () {
      final result = SimpleDateTime.toDateTime(
        date: '2025/11/18',
        inputFormat: 'dd-MM-yyyy',
      );

      expect(result, isNull);
    });
  });
}
