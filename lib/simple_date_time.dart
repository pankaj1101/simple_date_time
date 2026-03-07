library simple_date_time;

import 'package:simple_date_time/src/formatter/date_time_formatter.dart';
import 'package:simple_date_time/src/parser/date_time_parser.dart';

import 'enums/simple_date_format_enums.dart';
import 'enums/simple_time_format_enums.dart';

export 'enums/simple_date_format_enums.dart';
export 'enums/simple_time_format_enums.dart';

/// A helper class offering simple date/time formatting and parsing utilities.
///
/// All methods are static, making it easy to access them without instantiating the class.
class SimpleDateTime {
  /// Formats a date string into a desired pattern.
  ///
  /// The input [date] is parsed with `DateTime.parse` after being URL-decoded.
  /// If the string contains a space but no `T` separator it is converted to
  /// ISO 8601 form. The resulting `DateTime` is converted to local time.
  ///
  /// Either [customFormat] or [dateFormatPreset] may be provided to select the
  /// output pattern; presets are defined by [SimpleDateFormat].
  /// If [includeTime] is true a time portion is appended using either
  /// [timeFormatPreset] or a default of `hh:mm a`.
  ///
  /// Returns an empty string on parse failure or when [date] is null/empty.
  static String formatStringDateTime({
    String? date,
    String? customFormat = 'yyyy-MM-dd',
    SimpleDateFormat? dateFormatPreset,
    SimpleTimeFormat? timeFormatPreset,
    bool includeTime = false,
  }) {
    try {
      if (date == null || date.isEmpty) return '';

      String decoded = Uri.decodeComponent(date);

      if (decoded.contains(' ') && !decoded.contains('T')) {
        decoded = decoded.replaceFirst(' ', 'T');
      }

      DateTime dateTime = DateTime.parse(decoded).toLocal();

      final datePattern =
          dateFormatPreset?.pattern ?? customFormat ?? 'yyyy-MM-dd';

      final formattedDate = DateTimeFormatter.format(dateTime, datePattern);

      if (includeTime) {
        final timePattern =
            timeFormatPreset?.pattern ?? SimpleTimeFormat.hhMmAmPm.pattern;
        final formattedTime = DateTimeFormatter.format(dateTime, timePattern);
        return '$formattedDate $formattedTime';
      }

      return formattedDate;
    } catch (_) {
      return '';
    }
  }

  /// Formats the provided [dateTime] according to the given options.
  ///
  /// Similar to [formatStringDateTime] but accepts a `DateTime` directly.
  /// The resulting value may be converted to local time based on [toLocal].
  ///
  /// [customFormat] and [dateFormatPreset] control the date portion, while
  /// [timeFormatPreset] and [includeTime] determine the time portion. Defaults
  /// mirror those in [formatStringDateTime].
  ///
  /// Returns an empty string if formatting fails.
  static String formatDateTime({
    required DateTime dateTime,
    String? customFormat,
    SimpleDateFormat? dateFormatPreset,
    SimpleTimeFormat? timeFormatPreset,
    bool includeTime = false,
    bool toLocal = true,
  }) {
    try {
      final DateTime finalDateTime = toLocal ? dateTime.toLocal() : dateTime;

      final datePattern =
          dateFormatPreset?.pattern ?? customFormat ?? 'yyyy-MM-dd';

      final formattedDate =
          DateTimeFormatter.format(finalDateTime, datePattern);

      if (includeTime) {
        final timePattern =
            timeFormatPreset?.pattern ?? SimpleTimeFormat.hhMmAmPm.pattern;

        final formattedTime =
            DateTimeFormatter.format(finalDateTime, timePattern);

        return '$formattedDate $formattedTime';
      }

      return formattedDate;
    } catch (_) {
      return '';
    }
  }

  /// Attempts to parse the string [date] using [inputFormat].
  ///
  /// If [toLocal] is true the resulting `DateTime` is converted to the local
  /// timezone. Returns `null` when parsing fails.
  static DateTime? toDateTime({
    required String date,
    required String inputFormat,
    bool toLocal = true,
  }) {
    try {
      final parsed = DateTimeParser.parse(date.trim(), inputFormat);
      return toLocal ? parsed.toLocal() : parsed;
    } catch (_) {
      return null;
    }
  }
}
