import '../utils/date_tokens.dart';

class DateTimeFormatter {
  static String format(DateTime date, String pattern) {
    final replacements = DateTokens.buildTokenMap(date);

    final keys = replacements.keys.toList()
      ..sort((a, b) => b.length.compareTo(a.length));

    String result = pattern;

    for (final key in keys) {
      result = result.replaceAll(key, replacements[key]!);
    }

    return result;
  }
}
