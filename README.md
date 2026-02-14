<p align="center">
  <img src="assets/banner.png" alt="simple_date_time banner" />
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
- ✅ Safe parsing (no crashes)
- ✅ Locale-aware via `intl`
- ✅ Tiny, dependency-light package

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  simple_date_time: ^0.0.1
````

Then run:

```bash
flutter pub get
```

---

## 🚀 Usage

Import the package:

```dart
import 'package:simple_date_time/simple_date_time.dart';
```

---

## 📅 Format Date from String

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

## 📄 License

MIT License
Free to use in personal and commercial projects.

---

## ❤️ Author

Built with care for real-world Flutter apps.

Happy coding 🚀
