import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'kuis1/main.dart';

void main() {
  // Set fixed window size for web/desktop to match 1220x2712 target
  WidgetsFlutterBinding.ensureInitialized();

  // Configure system UI overlay for transparent status bar with white icons
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const Kuis1App());
}