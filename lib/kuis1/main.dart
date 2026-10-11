export 'home_screen.dart';

import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() => runApp(const Kuis1App());

class Kuis1App extends StatelessWidget {
  const Kuis1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuis 1 - Home Screen',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'PlusJakartaSans',
      ),
      home: const Kuis1HomeScreen(),
    );
  }
}