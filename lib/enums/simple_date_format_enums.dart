/// Supported date formats used throughout the package.
///
/// Each value corresponds to a human-readable pattern that can be
/// retrieved via [AppDateFormatExtension.pattern].
///
/// Examples are included in comments for quick reference.
enum SimpleDateFormat {
  yyyyMMdd, // 2025-11-18
  ddMMyyyy, // 18-11-2025
  ddMMMyyyy, // 18 Nov 2025
  mMMddyyyy, // Nov 18, 2025
  yyyyMMddSlash, // 2025/11/18
}

extension AppDateFormatExtension on SimpleDateFormat {
  String get pattern {
    switch (this) {
      case SimpleDateFormat.yyyyMMdd:
        return 'yyyy-MM-dd';
      case SimpleDateFormat.ddMMyyyy:
        return 'dd-MM-yyyy';
      case SimpleDateFormat.ddMMMyyyy:
        return 'dd MMM yyyy';
      case SimpleDateFormat.mMMddyyyy:
        return 'MMM dd, yyyy';
      case SimpleDateFormat.yyyyMMddSlash:
        return 'yyyy/MM/dd';
    }
  }
}
