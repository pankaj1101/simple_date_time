class DateTokens {
  static const monthsShort = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  static const monthsFull = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static const weekdays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  static Map<String, String> buildTokenMap(DateTime date) {
    final hour12 = date.hour == 0
        ? 12
        : date.hour > 12
            ? date.hour - 12
            : date.hour;

    return {
      "yyyy": date.year.toString(),
      "yy": (date.year % 100).toString().padLeft(2, '0'),

      "MM": date.month.toString().padLeft(2, '0'),
      "dd": date.day.toString().padLeft(2, '0'),

      "MMM": monthsShort[date.month - 1],
      "MMMM": monthsFull[date.month - 1],

      "HH": date.hour.toString().padLeft(2, '0'), // 24-hour
      "hh": hour12.toString().padLeft(2, '0'), // 12-hour

      "mm": date.minute.toString().padLeft(2, '0'),
      "ss": date.second.toString().padLeft(2, '0'),

      "a": date.hour >= 12 ? "PM" : "AM",
    };
  }
}
