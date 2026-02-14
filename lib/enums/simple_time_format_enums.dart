/// A collection of simple time formats supported by the package.
///
/// Use [AppTimeFormatExtension.pattern] to obtain the corresponding
/// `DateFormat` pattern string used for formatting or parsing.
///
/// Inline comments provide example outputs for each format.
enum SimpleTimeFormat {
  hhMmAmPm, // 10:30 AM
  hhMm, // 10:30
  hHmm, // 22:30
  hHmmss, // 22:30:45
}

extension AppTimeFormatExtension on SimpleTimeFormat {
  String get pattern {
    switch (this) {
      case SimpleTimeFormat.hhMmAmPm:
        return 'hh:mm a';
      case SimpleTimeFormat.hhMm:
        return 'hh:mm';
      case SimpleTimeFormat.hHmm:
        return 'HH:mm';
      case SimpleTimeFormat.hHmmss:
        return 'HH:mm:ss';
    }
  }
}
