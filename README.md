<p align="center">
  <img src="https://raw.githubusercontent.com/pankaj1101/simple_date_time/refs/heads/main/assets/banner.png"
       alt="simple_date_time banner" />
</p>

# simple_date_time

A lightweight Flutter utility to **parse and format date & time safely** using
simple functions and **preset enums**.

Designed to avoid common backend date issues and reduce repetitive boilerplate
across Flutter projects.

---

## ✨ Features

- ✅ Format date from **String**
- ✅ Format date from **DateTime**
- ✅ Convert **String → DateTime**
- ✅ Preset enums for date & time formats
- ✅ Support for **custom date format strings**
- ✅ Safe parsing (no crashes)
- ✅ Locale-aware via `intl`
- ✅ Tiny, dependency-light package

---

## 🚀 Usage

Import the package:

```dart
import 'package:simple_date_time/simple_date_time.dart';
```

---

## 📅 Format Date from String (Preset)

```dart
SimpleDateTime.formatStringDateTime(
  date: '2025-11-18 22:30:45.000',
  dateFormatPreset: SimpleDateFormat.ddMMMyyyy,
);
```

**Output**

```
18 Nov 2025
```

---

## 🎨 Format Date from String (Custom Format)

Use `customFormat` when you want full control over the date pattern.

```dart
SimpleDateTime.formatStringDateTime(
  date: '2025-11-18 22:30:45.000',
  customFormat: 'EEEE, dd MMM yyyy',
);
```

**Output**

```
Tuesday, 18 Nov 2025
```

> ℹ️ `customFormat` uses `intl` date patterns.

---

## ⏰ Format Date + Time from String

```dart
SimpleDateTime.formatStringDateTime(
  date: '2025-11-18 22:30:45.000',
  dateFormatPreset: SimpleDateFormat.ddMMMyyyy,
  timeFormatPreset: SimpleTimeFormat.hhMmAmPm,
  includeTime: true,
);
```

**Output**

```
18 Nov 2025 10:30 PM
```

---

## 📆 Format from DateTime

```dart
SimpleDateTime.formatDateTime(
  dateTime: DateTime.now(),
  dateFormatPreset: SimpleDateFormat.ddMMMyyyy,
  timeFormatPreset: SimpleTimeFormat.hhMmAmPm,
  includeTime: true,
);
```

---

## 🔄 Convert String to DateTime

```dart
final dateTime = SimpleDateTime.toDateTime(
  date: '18-11-2025',
  inputFormat: 'dd-MM-yyyy',
);
```

Returns `DateTime?`
Returns `null` if parsing fails.

---

## 🧩 Date Format Presets

```dart
enum SimpleDateFormat {
  yyyyMMdd,      // 2025-11-18
  ddMMyyyy,      // 18-11-2025
  ddMMMyyyy,     // 18 Nov 2025
  mMMddyyyy,     // Nov 18, 2025
  yyyyMMddSlash, // 2025/11/18
}
```

---

## ⏱ Time Format Presets

```dart
enum SimpleTimeFormat {
  hhMmAmPm, // 10:30 AM
  hhMm,     // 10:30
  hHmm,     // 22:30
  hHmmss,   // 22:30:45
}
```

---

## 🌍 Timezone Handling

* String-based APIs automatically convert to **local time**
* DateTime APIs support `toLocal` toggle

```dart
SimpleDateTime.formatDateTime(
  dateTime: utcDateTime,
  toLocal: false,
);
```

---

## 🛡 Error Handling

* Invalid input → returns empty string (`''`)
* Invalid parsing → returns `null`
* No uncaught exceptions

Safe for production use.

---

## 📌 When to Use

* Backend date strings
* API responses
* Logs, orders, chats, timelines
* Replacing repeated `DateFormat` code

---

## License
MIT License © 2026 Pankaj Ram

---

## ❤️ Author

Built with care for real-world Flutter apps.

Happy coding 🚀