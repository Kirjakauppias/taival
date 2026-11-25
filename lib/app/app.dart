import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';

/// Taival-sovelluksen pääwidget.
class TaivalApp extends StatefulWidget {
  const TaivalApp({super.key});

  @override
  State<TaivalApp> createState() => _TaivalAppState();
}

class _TaivalAppState extends State<TaivalApp> {
  // Luodaan reititin kerran tämän widgetin elinkaaren aikana.
  late final GoRouter _router = AppRouter.createRouter();

  @override
  void dispose() {
    // Vapautetaan reitittimen resurssit.
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Taival',

      debugShowCheckedModeBanner: false,

      // Säilytetään olemassa olevat teemat.
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,

      // Otetaan uusi reititysjärjestelmä käyttöön.
      routerConfig: _router,
    );
  }
}
