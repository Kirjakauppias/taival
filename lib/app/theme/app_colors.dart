import 'package:flutter/material.dart';

/// Taival-sovelluksen keskitetyt värimääritykset.
class AppColors {
  // Estetään luokan olioiden luominen.
  AppColors._();

  // Sovelluksen pääväri.
  static const Color primary = Color(0xFF315C4b);

  // Vaalean teeman taustaväri.
  static const Color lightBackground = Color(0xFFEAF2ED);

  // Kalenteritapahtumien tunnusvärit.
  static const Color workShift = Color(0xFF4285C5);
  static const Color personalA = Color(0xFFC27C5C);
  static const Color personalB = Color(0xFFA98AD8);
  static const Color sharedEvent = Color(0xFF47A879);
}
