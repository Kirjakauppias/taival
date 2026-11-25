import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/calendar/presentation/calendar_screen.dart';
import '../layout/taival_shell.dart';

/// Sovelluksen reitittimen osoiteet.
class AppRoutes {
  AppRoutes._();

  static const String calendar = '/calendar';
  static const String events = '/events';
  static const String settings = '/settings';
}

/// Taivalin keskitetty reititysmääritys.
class AppRouter {
  AppRouter._();

  // GoRouter on reititysjärjestelmän pääolio.
  // Se määrittelee, mitä näkymää tietti URL-osoite vastaa.

  // createRouter() on tehdasmetodi, joka luo GoRouter -olion.
  // Valinnainen initLocation auttaa myöhemmin testaamaan yksittäisiä reittejä.
  static GoRouter createRouter({String? initialLocation}) {
    return GoRouter(
      // Oletuksena avataan kalenteri.
      initialLocation: initialLocation ?? AppRoutes.calendar,

      // Näytetään virhesivu tuntemattomille osoitteille.
      // errorBuilder määrittelee virhesivun tilanteeseen,
      // jossa käyttäjä yrittää avata osoitteen, jota ei ole olemassa.
      errorBuilder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Taival')),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Sivua ei löytynyt.'),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => context.go(AppRoutes.calendar),
                  child: const Text('Takaisin kalenteriin'),
                ),
              ],
            ),
          ),
        );
      },

      routes: [
        // Ohjataan juuriosoite kalenteriin.
        // GoRoute määrittelee yksittäisen reitin,
        // Esim. /calendar näyttää CalendarScreen -widgetin.
        GoRoute(path: '/', redirect: (context, state) => AppRoutes.calendar),

        // Yhteinen navigointirakenne kaikille näkymille.
        // ShellRoute käärii kaikki kolme näkymää samaan sovellusrakenteeseen.
        // Näin yläpalkki ja navigointivalikot pysyvät käytössä, vaikka käyttäjä
        // siirtyy sivulta toiselle.
        ShellRoute(
          builder: (context, state, child) {
            return TaivalShell(location: state.uri.path, child: child);
          },
          routes: [
            // Kalenterinäkymä.
            GoRoute(
              path: AppRoutes.calendar,
              builder: (context, state) {
                return const CalendarScreen();
              },
            ),

            // Menot-näkymä.
            GoRoute(
              path: AppRoutes.events,
              builder: (context, state) {
                return const Center(
                  child: Text('Menot-näkymä rakennetaan myöhemmin.'),
                );
              },
            ),

            // Asetukset-näkymä.
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) {
                return const Center(
                  child: Text('Asetukset-näkymä rakennetaan myöhemmin.'),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
