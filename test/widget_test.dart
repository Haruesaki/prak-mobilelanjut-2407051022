import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/main.dart';

void main() {
  setUpAll(() async {
    final font = FontLoader('PlusJakartaSans')
      ..addFont(rootBundle.load('assets/fonts/PlusJakartaSans.ttf'));
    await font.load();
  });
  for (final width in [320.0, 393.0, 575.0, 768.0, 1000.0, 1366.0, 1920.0]) {
    testWidgets('Layout fits a $width pixel viewport', (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = Size(width, 800);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const MyApp());
      await tester.pump(const Duration(seconds: 1));
      expect(find.text('TENTANG OSAMAKOM'), findsOneWidget);
      expect(tester.takeException(), isNull);
      expect(
        find.byTooltip('Buka menu'),
        width < 1000 ? findsOneWidget : findsNothing,
      );
      final first = tester.getTopLeft(find.text('TATA TERTIB PESERTA'));
      final second = tester.getTopLeft(find.text('RUNDOWN ACARA 2026'));
      if (width >= 1000) {
        expect(second.dy, closeTo(first.dy, 1));
        expect(second.dx, greaterThan(first.dx));
      } else {
        expect(second.dy, greaterThan(first.dy));
      }
      final navbar = find.byKey(const ValueKey('osamakom-navbar'));
      final originalPosition = tester.getTopLeft(navbar);
      await tester.drag(
        find.byKey(const ValueKey('osamakom-scroll')),
        const Offset(0, -800),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(tester.getTopLeft(navbar), originalPosition);
      expect(tester.takeException(), isNull);
    });
  }

  for (final width in [393.0, 1366.0]) {
    testWidgets('Buttons remain enabled without actions at $width', (
      tester,
    ) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = Size(width, 1400);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const MyApp());
      final buttons = find.byWidgetPredicate(
        (widget) =>
            widget is TextButton ||
            widget is FilledButton ||
            widget is IconButton,
      );
      expect(buttons, findsNWidgets(width < 1000 ? 4 : 10));
      for (var i = 0; i < buttons.evaluate().length; i++) {
        final button = tester.widget(buttons.at(i));
        expect(
          button is ButtonStyleButton
              ? button.onPressed
              : (button as IconButton).onPressed,
          isNotNull,
        );
        await tester.tap(buttons.at(i));
        await tester.pump(const Duration(milliseconds: 300));
        expect(find.byType(AlertDialog), findsNothing);
        expect(find.byType(TextField), findsNothing);
        expect(find.byType(PopupMenuItem<String>), findsNothing);
        expect(find.byType(MyApp), findsOneWidget);
        expect(tester.takeException(), isNull);
      }
      await tester.pumpWidget(const SizedBox.shrink());
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('Logo ring rotates continuously while text stays still', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    final ring = find.byType(RotationTransition).first;
    final text = find.text('OSAMAKOM');
    final originalPosition = tester.getTopLeft(text);
    expect(tester.widget<RotationTransition>(ring).turns.value, 0);
    await tester.pump(const Duration(seconds: 6));
    expect(
      tester.widget<RotationTransition>(ring).turns.value,
      closeTo(.25, .001),
    );
    await tester.pump(const Duration(seconds: 24));
    expect(
      tester.widget<RotationTransition>(ring).turns.value,
      closeTo(.25, .001),
    );
    expect(tester.getTopLeft(text), originalPosition);
    expect(
      find.ancestor(of: text, matching: find.byType(RotationTransition)),
      findsNothing,
    );
    await tester.pumpWidget(const SizedBox.shrink());
    expect(tester.takeException(), isNull);
  });
}
