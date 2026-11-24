import 'package:flutter/material.dart';

import '../../features/calendar/presentation/calendar_screen.dart';
import 'responsive_scaffold.dart';

/// Sovelluksen navigoinnin ja näkymien hallinta.
class TaivalShell extends StatefulWidget {
  const TaivalShell({super.key});

  @override
  State<TaivalShell> createState() => _TaivalShellState();
}

class _TaivalShellState extends State<TaivalShell> {
  // Oletuksena näytetään kalenteri.
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Nykyiset näkymät.
    // Menot ja asetukset ovat vielä paikkamerkkejä.
    const pages = <Widget>[
      CalendarScreen(),
      Center(child: Text('Menot-näkymä rakennetaan myöhemmin.')),
      Center(child: Text('Asetukset-näkymä rakennetaan myöhemmin.')),
    ];

    return ResponsiveScaffold(
      selectedIndex: _selectedIndex,

      // Päivitetään valittu navigointikohde.
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },

      // Näytetään valittu sisältö.
      child: pages[_selectedIndex],
    );
  }
}
