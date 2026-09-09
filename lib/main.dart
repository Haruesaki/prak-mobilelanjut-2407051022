import 'package:flutter/material.dart';
import 'columnWidget.dart';
import 'rowWidget.dart';
import 'firstWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Mobile Lanjut',
      theme : ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const FirstWidget()
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Praktikum Mobile Lanjut'),
      //   ),
      //   body: const Center(
      //     child: Text('Halo Nama Saya Haruesaki'),
      //   ),
      // ),
    );
  }
}