import 'package:flutter/material.dart';

/// Sovelluksen responsiivinen perusrakenne.
class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.child,
  });

  // Raja, jonka jälkeen käytetään sivuvalikkoa.
  static const double desktopBreakpoint = 800;

  // Aktiivisen navigointikohteen indeksi.
  final int selectedIndex;

  // Kutsutaan, kun käyttäjä valitsee kohteen.
  final ValueChanged<int> onDestinationSelected;

  // Näytettävän näkymän sisältö.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Tutkitaan käytettävissä olevaa leveyttä.
        final isWide = constraints.maxWidth >= desktopBreakpoint;

        return Scaffold(
          appBar: AppBar(title: const Text('Taival')),

          // Leveällä näytöllä sivuvalikko.
          // Kapealla näytöllä pelkkä sisältö.
          body: isWide
              ? Row(
                  children: [
                    SafeArea(
                      child: NavigationRail(
                        selectedIndex: selectedIndex,
                        onDestinationSelected: onDestinationSelected,
                        labelType: NavigationRailLabelType.all,
                        destinations: const [
                          NavigationRailDestination(
                            icon: Icon(Icons.calendar_month_outlined),
                            selectedIcon: Icon(Icons.calendar_month),
                            label: Text('Kalenteri'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.list_outlined),
                            selectedIcon: Icon(Icons.list),
                            label: Text('Menot'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.settings_outlined),
                            selectedIcon: Icon(Icons.settings),
                            label: Text('Asetukset'),
                          ),
                        ],
                      ),
                    ),

                    const VerticalDivider(width: 1),

                    // Sisältö täyttää jäljelle jäävän tilan.
                    Expanded(child: SafeArea(child: child)),
                  ],
                )
              : SafeArea(child: child),

          // Mobiilissa navigointi näytön alareunaan.
          bottomNavigationBar: isWide
              ? null
              : NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onDestinationSelected,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.calendar_month_outlined),
                      selectedIcon: Icon(Icons.calendar_month),
                      label: 'Kalenteri',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.list_outlined),
                      selectedIcon: Icon(Icons.list),
                      label: 'Menot',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.settings_outlined),
                      selectedIcon: Icon(Icons.settings),
                      label: 'Asetukset',
                    ),
                  ],
                ),
        );
      },
    );
  }
}
