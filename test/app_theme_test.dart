import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taival/app/app.dart';
import 'package:taival/app/theme/app_colors.dart';
import 'package:taival/app/theme/app_theme.dart';

void main() {
  test('Light theme uses light brightness', () {
    final theme = AppTheme.light;

    expect(theme.brightness, Brightness.light);
    expect(theme.useMaterial3, isTrue);
    expect(theme.scaffoldBackgroundColor, AppColors.lightBackground);
  });

  test('Dark theme uses dark brightness', () {
    final theme = AppTheme.dark;

    expect(theme.brightness, Brightness.dark);
    expect(theme.useMaterial3, isTrue);
  });

  test('Event categories have unique colors', () {
    final colors = {
      AppColors.workShift,
      AppColors.personalA,
      AppColors.personalB,
      AppColors.sharedEvent,
    };

    expect(colors.length, 4);
  });

  testWidgets('Taival uses system theme mode', (tester) async {
    await tester.pumpWidget(const TaivalApp());

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));

    expect(app.themeMode, ThemeMode.system);
    expect(app.theme?.brightness, Brightness.light);
    expect(app.darkTheme?.brightness, Brightness.dark);
  });

  test('Event categories use the defined colors', () {
    expect(AppColors.workShift, const Color(0xFF4285C5));

    expect(AppColors.personalA, const Color(0xFFC27C5C));

    expect(AppColors.personalB, const Color(0xFFA98AD8));

    expect(AppColors.sharedEvent, const Color(0xFF47A879));
  });

  testWidgets('Taival follows the system dark theme', (
    WidgetTester tester,
  ) async {
    // Simuloidaan järjestelmän tummaa tilaa.
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;

    // Palautetaan alkuperäinen asetus testin jälkeen.
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);

    // Käynnistetään sovellus testiympäristössä.
    await tester.pumpWidget(const TaivalApp());

    // Odotetaan mahdollisten animaatioiden valmistumista.
    await tester.pumpAndSettle();

    // Haetaan aktiivinen teema kalenterinäkymän sisältä.
    final context = tester.element(find.byType(Scaffold));
    final theme = Theme.of(context);

    // Varmistetaan, että tumma teema on käytössä.
    expect(theme.brightness, Brightness.dark);
  });
}
