import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taival/app/app.dart';

void main() {
  testWidgets('Mobile layout displays NavigationBar', (
    WidgetTester tester,
  ) async {
    // Simuloidaan mobiilinäytön kokoa.
    await tester.binding.setSurfaceSize(const Size(390, 844));

    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    await tester.pumpWidget(const TaivalApp());

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);
    expect(find.text('Taival'), findsOneWidget);
  });

  testWidgets('Desktop layout displays NavigationRail', (
    WidgetTester tester,
  ) async {
    // Simuloidaan leveää selainikkunaa.
    await tester.binding.setSurfaceSize(const Size(1200, 800));

    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    await tester.pumpWidget(const TaivalApp());

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });

  testWidgets('Mobile navigation changes displayed content', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));

    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    await tester.pumpWidget(const TaivalApp());

    // Aluksi näytetään kalenteri.
    expect(find.text('Yhteinen kalenteri rakentuu tänne.'), findsOneWidget);

    // Valitaan Menot.
    await tester.tap(find.text('Menot'));
    await tester.pumpAndSettle();

    expect(find.text('Menot-näkymä rakennetaan myöhemmin.'), findsOneWidget);

    // Tarkistetaan, ettei layout-virheitä syntynyt.
    expect(tester.takeException(), isNull);
  });
}
