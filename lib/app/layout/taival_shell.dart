import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_router.dart';
import 'responsive_scaffold.dart';

/// Taivalin sovellusrunko ja navigoinnin yhdistäminen reitteihin.
class TaivalShell extends StatelessWidget {
  const TaivalShell({super.key, required this.location, required this.child});

  // Nykyisen sivun URL-polku.
  final String location;

  // Reitittimen toimittama sivun sisältö.
  final Widget child;

  // Navigointikohteiden osoitteet.
  static const List<String> _paths = [
    AppRoutes.calendar,
    AppRoutes.events,
    AppRoutes.settings,
  ];

  @override
  Widget build(BuildContext context) {
    // Selvitetään aktiivisen sivun indeksi URL:n perusteella.
    final selectedIndex = _paths.indexOf(location);

    return ResponsiveScaffold(
      selectedIndex: selectedIndex == -1 ? 0 : selectedIndex,

      // Käyttäjä valitsee navigointikohteen.
      onDestinationSelected: (index) {
        final destination = _paths[index];

        // Ei navigoida uudelleen jo avoinna olevalle sivulle.
        if (destination != location) {
          context.go(destination);
        }
      },

      // Reitittimen antama sivun sisältö.
      child: child,
    );
  }
}
