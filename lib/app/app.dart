// Tuodaan kalenterinäkymä käyttöön.
import 'package:flutter/material.dart';

import '../features/calendar/presentation/calendar_screen.dart';

// Sovelluksen pääwidget.
class TaivalApp extends StatelessWidget {
  const TaivalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Sovelluksen nimi.
      title: 'Taival',

      // Poistetaan debug-merkintä.
      debugShowCheckedModeBanner: false,

      // Sovelluksen ensimmäinen nakymä.
      home: CalendarScreen(),
    );
  }
}
