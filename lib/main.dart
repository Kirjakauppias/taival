import 'package:flutter/material.dart';
// Tuo Flutterin Material-komponentit käyttöön.

import 'package:flutter_web_plugins/url_strategy.dart';

// Tuodaan Taivalin pääwidget käyttöön.
import 'app/app.dart';

// Sovelluksen käynnistyspiste.
void main() {
  // Käytetään /calendar-tyyppistä URL-osoitetta.
  // usePathUrlStrategy() poistaa URL-osoitteista #-merkin.
  // Tämä vaatii myöhemmin Firebase Hostingissa SPA-uudelleenohjauksen,
  // jotta myös suoraan avattavat reitit toimivat. Flutterin paikallinen
  // kehityspalvelin tukee tätä jo valmiiksi.
  usePathUrlStrategy();

  // Käynnistetään Flutter-sovellus
  runApp(const TaivalApp());
}
