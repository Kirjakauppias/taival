// Tuodaan kalenterinäkymä käyttöön.
import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import '../features/calendar/presentation/calendar_screen.dart';

// Sovelluksen pääwidget.
class TaivalApp extends StatelessWidget {
  const TaivalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Sovelluksen nimi.
      title: 'Taival',

      // Poistetaan debug-merkintä.
      debugShowCheckedModeBanner: false,

      // Vaalea teema.
      theme: AppTheme.light,

      // Tumma teema
      darkTheme: AppTheme.dark,

      // Seuraa käyttöjärjestelmän väriasetusta.
      themeMode: ThemeMode.system,

      // Sovelluksen ensimmäinen nakymä.
      home: CalendarScreen(),
    );
  }
}
