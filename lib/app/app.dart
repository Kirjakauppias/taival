// Tuodaan kalenterinäkymä käyttöön.
import 'package:flutter/material.dart';

import 'layout/taival_shell.dart';
import 'theme/app_theme.dart';

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

      // Responsiivinen sovellusrakenne.
      home: const TaivalShell(),
    );
  }
}
