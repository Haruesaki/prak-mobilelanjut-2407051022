import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/kuis1/home_screen.dart';

void main() {
  setUpAll(() async {
    final font = FontLoader('PlusJakartaSans')
      ..addFont(rootBundle.load('assets/fonts/PlusJakartaSans.ttf'));
    await font.load();
  });
  testWidgets('Kuis1HomeScreen renders without errors', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1220, 2712);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      const MaterialApp(
        home: Kuis1HomeScreen(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(Kuis1HomeScreen), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
