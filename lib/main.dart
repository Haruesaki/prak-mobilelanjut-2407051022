import 'package:flutter/material.dart';

import 'osamakom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OSAMAKOM 2026 - FMIPA Unila',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'PlusJakartaSans',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF202482)),
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
      ),
      home: const OsamakomPage(),
    );
  }
}
