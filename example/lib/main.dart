import 'package:flutter/material.dart';
import 'package:simple_date_time/simple_date_time.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const DateExampleScreen(),
    );
  }
}

class DateExampleScreen extends StatelessWidget {
  const DateExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String formatted1 = SimpleDateTime.formatDateTime(
      dateTime: now,
      dateFormatPreset: SimpleDateFormat.yyyyMMdd,
    );

    String formatted2 = SimpleDateTime.formatDateTime(
      dateTime: now,
      dateFormatPreset: SimpleDateFormat.ddMMMyyyy,
    );

    String formatted3 = SimpleDateTime.formatDateTime(
      dateTime: now,
      dateFormatPreset: SimpleDateFormat.yyyyMMddSlash,
    );

    String formatted4 = SimpleDateTime.formatStringDateTime(
      date: formatted1,
      customFormat: "yyyy/MM/dd hh:mm a",
    );

    String formatted5 = SimpleDateTime.formatStringDateTime(
      date: formatted1,
      customFormat: "dd MMM yyyy hh:mm a",
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Simple Date Time Example")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Current DateTime:", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(now.toString()),
            SizedBox(height: 20),

            Text("yyyy-MM-dd → $formatted1"),
            SizedBox(height: 10),

            Text("dd MMM yyyy → $formatted2"),
            SizedBox(height: 10),

            Text("EEEE, dd MMM yyyy → $formatted3"),
            SizedBox(height: 10),

            Text("yyyy-MM-dd hh:mm a → $formatted4"),
            SizedBox(height: 10),

            Text("dd MMM yyyy hh:mm a → $formatted5"),
          ],
        ),
      ),
    );
  }
}
