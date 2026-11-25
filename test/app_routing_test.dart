import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taival/app/router/app_router.dart';

void main() {
  testWidgets('Calendar route displays the calendar screen', (
    WidgetTester tester,
  ) async {
    final router = AppRouter.createRouter(initialLocation: AppRoutes.calendar);

    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.pumpAndSettle();

    expect(find.text('Yhteinen kalenteri rakentuu tänne.'), findsOneWidget);
  });

  testWidgets('Events route displays events and selects navigation', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));

    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    final router = AppRouter.createRouter(initialLocation: AppRoutes.events);

    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.pumpAndSettle();

    expect(find.text('Menot-näkymä rakennetaan myöhemmin.'), findsOneWidget);

    // Menot on toinen navigointikohde.
    final navigationBar = tester.widget<NavigationBar>(
      find.byType(NavigationBar),
    );

    expect(navigationBar.selectedIndex, 1);
  });

  testWidgets('Navigation updates the active route', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));

    addTearDown(() async {
      await tester.binding.setSurfaceSize(null);
    });

    final router = AppRouter.createRouter();

    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.pumpAndSettle();

    // Siirrytään asetuksiin.
    await tester.tap(find.text('Asetukset'));
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, AppRoutes.settings);

    expect(
      find.text('Asetukset-näkymä rakennetaan myöhemmin.'),
      findsOneWidget,
    );
  });

  testWidgets('Unknown route displays error page', (WidgetTester tester) async {
    final router = AppRouter.createRouter(initialLocation: '/tuntematon');

    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.pumpAndSettle();

    expect(find.text('Sivua ei löytynyt.'), findsOneWidget);

    // Virhesivulta pääsee takaisin kalenteriin.
    await tester.tap(find.text('Takaisin kalenteriin'));
    await tester.pumpAndSettle();

    expect(find.text('Yhteinen kalenteri rakentuu tänne.'), findsOneWidget);
  });
}
