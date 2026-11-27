import '../models/calendar_event.dart';
import '../models/event_category.dart';

/// Paikallinen testitietovarasto kalenteritapahtumille.
///
/// Tapahtumat ovat kiinteää esimerkkidataa.
/// Tietovarasto ei tallenna muutoksia pysyvästi.
class SampleEventRepository {
  SampleEventRepository()
    : _events = List<CalendarEvent>.unmodifiable(
        _createSampleEvents()..sort(_compareEvents),
      );

  // Sisäinen tapahtumalista.
  final List<CalendarEvent> _events;

  /// Palauttaa kaikki tapahtumat aikajärjestyksessä.
  List<CalendarEvent> getAllEvents() {
    return _events;
  }

  /// Palauttaa annetun aikavälin kanssa
  /// päällekkäiset tapahtumat.
  ///
  /// Aikavälin loppu ei sisälly aikaväliin.
  List<CalendarEvent> getEventsInRange(DateTime start, DateTime end) {
    if (!start.isBefore(end)) {
      throw ArgumentError('Range end must be after range start.');
    }

    return List<CalendarEvent>.unmodifiable(
      _events.where(
        (event) => event.start.isBefore(end) && event.end.isAfter(start),
      ),
    );
  }

  /// Palauttaa yhden kalenteripäivän tapahtumat.
  List<CalendarEvent> getEventsForDay(DateTime date) {
    // Valitun päivän alku klo 00.00.
    final dayStart = DateTime(date.year, date.month, date.day);

    // Seuraavan päivän alku klo 00.00.
    final dayEnd = DateTime(date.year, date.month, date.day + 1);

    return getEventsInRange(dayStart, dayEnd);
  }

  /// Vertaa tapahtumia niiden alkamisajan mukaan.
  static int _compareEvents(CalendarEvent a, CalendarEvent b) {
    final comparison = a.start.compareTo(b.start);

    if (comparison != 0) {
      return comparison;
    }

    // Samanaikaiset tapahtumat järjestetään
    // tunnisteen mukaan.
    return a.id.compareTo(b.id);
  }

  /// Luo testitapahtumat.
  static List<CalendarEvent> _createSampleEvents() {
    return [
      CalendarEvent(
        id: 'work-001',
        title: 'Työvuoro',
        description: 'Aamuvuoro',
        start: DateTime(2026, 11, 30, 9),
        end: DateTime(2026, 11, 30, 17),
        category: EventCategory.workShift,
      ),

      CalendarEvent(
        id: 'personal-a-001',
        title: 'Harrastus',
        start: DateTime(2026, 12, 1, 18),
        end: DateTime(2026, 12, 1, 19, 30),
        category: EventCategory.personalA,
      ),

      CalendarEvent(
        id: 'personal-b-001',
        title: 'Kumppanin meno',
        start: DateTime(2026, 12, 3, 16, 30),
        end: DateTime(2026, 12, 3, 18),
        category: EventCategory.personalB,
      ),

      CalendarEvent(
        id: 'shared-001',
        title: 'Yhteinen illallinen',
        start: DateTime(2026, 12, 5, 18),
        end: DateTime(2026, 12, 5, 20),
        category: EventCategory.shared,
      ),

      // Yhden päivän tapahtuma.
      CalendarEvent(
        id: 'personal-a-002',
        title: 'Vapaapäivä',
        start: DateTime(2026, 12, 6),
        end: DateTime(2026, 12, 7),
        category: EventCategory.personalA,
        isAllDay: true,
      ),

      // Kolmelle päivälle ulottuva tapahtuma.
      CalendarEvent(
        id: 'shared-002',
        title: 'Yhteinen matka',
        start: DateTime(2026, 12, 10),
        end: DateTime(2026, 12, 13),
        category: EventCategory.shared,
        isAllDay: true,
      ),

      // Keskiyön yli jatkuva työvuoro.
      CalendarEvent(
        id: 'work-002',
        title: 'Yövuoro',
        start: DateTime(2026, 12, 11, 22),
        end: DateTime(2026, 12, 12, 2),
        category: EventCategory.workShift,
      ),
    ];
  }
}
