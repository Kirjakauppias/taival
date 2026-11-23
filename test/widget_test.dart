import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taival/app/app.dart';

void main() {
  testWidgets('Taival displays the initial calendar screen', (
    WidgetTester tester,
  ) async {
    // Rakennetaan sovelluksen widget-puu testiympäristöön.
    await tester.pumpWidget(const TaivalApp());

    // Tarkistetaan, että MaterialApp on olemassa.
    expect(find.byType(MaterialApp), findsOneWidget);

    // Tarkistetaan sovelluksen otsikko.
    expect(find.text('Taival'), findsOneWidget);

    // Tarkistetaan kalenterin aloitusteksi.
    expect(find.text('Yhteinen kalenteri rakentuu tänne.'), findsOneWidget);
  });
}
