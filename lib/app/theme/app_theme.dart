import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Taival-sovelluksen Material 3 -teemat.
class AppTheme {
  // Estetään luokan olioiden luominen.
  AppTheme._();

  // Vaalea teema.
  static ThemeData get light {
    return _buildTheme(Brightness.light);
  }

  // Tumma teema.
  static ThemeData get dark {
    return _buildTheme(Brightness.dark);
  }

  // Molempien teemojen yhteinen muodostus.
  static ThemeData _buildTheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
    );

    final backgroundColor = brightness == Brightness.light
        ? AppColors.lightBackground
        : colorScheme.surface;

    return ThemeData(
      useMaterial3: true,

      // Sovelluksen yleinen värijärjestelmä.
      colorScheme: colorScheme,

      // Sivujen taustaväri.
      scaffoldBackgroundColor: backgroundColor,

      // Yläpalkin tyyli.
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: colorScheme.onSurface,
        centerTitle: false,
      ),

      // Sovelluksen typografia.
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
    );
  }
}
