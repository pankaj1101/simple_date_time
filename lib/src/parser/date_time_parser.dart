class DateTimeParser {
  static DateTime parse(String date, String pattern) {
    final patternParts = pattern.split(RegExp(r'[-/ :T]'));
    final dateParts = date.split(RegExp(r'[-/ :T]'));

    /// Ensure format matches
    if (patternParts.length != dateParts.length) {
      throw const FormatException('Invalid format');
    }

    int year = 0;
    int month = 1;
    int day = 1;
    int hour = 0;
    int minute = 0;
    int second = 0;

    for (int i = 0; i < patternParts.length; i++) {
      final value = int.tryParse(dateParts[i]);

      if (value == null) {
        throw const FormatException('Invalid number');
      }

      switch (patternParts[i]) {
        case "yyyy":
          if (dateParts[i].length != 4) {
            throw const FormatException('Invalid year');
          }
          year = value;
          break;

        case "MM":
          if (value < 1 || value > 12) {
            throw const FormatException('Invalid month');
          }
          month = value;
          break;

        case "dd":
          if (value < 1 || value > 31) {
            throw const FormatException('Invalid day');
          }
          day = value;
          break;

        case "HH":
          if (value < 0 || value > 23) {
            throw const FormatException('Invalid hour');
          }
          hour = value;
          break;

        case "mm":
          if (value < 0 || value > 59) {
            throw const FormatException('Invalid minute');
          }
          minute = value;
          break;

        case "ss":
          if (value < 0 || value > 59) {
            throw const FormatException('Invalid second');
          }
          second = value;
          break;

        default:
          throw const FormatException('Unsupported token');
      }
    }

    return DateTime(year, month, day, hour, minute, second);
  }
}
