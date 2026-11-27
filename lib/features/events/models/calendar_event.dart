import 'event_category.dart';

/// Kuvaa yhtä Taival-kalenterin tapahtumaa.
class CalendarEvent {
  /// Luo tapahtuman ja tarkistaa perustietojen oikeellisuuden.
  CalendarEvent({
    required this.id,
    required this.title,
    required this.start,
    required this.end,
    required this.category,
    this.description,
    this.isAllDay = false,
  }) {
    // Tunniste ei saa olla tyhjä.
    if (id.trim().isEmpty) {
      throw ArgumentError.value(id, 'id', 'Event ID cannot be empty.');
    }

    // Otsikko ei saa olla tyhjä.
    if (title.trim().isEmpty) {
      throw ArgumentError.value(title, 'title', 'Event title cannot be empty.');
    }

    // Päättymisajan on oltava alkamisajan jälkeen.
    if (!start.isBefore(end)) {
      throw ArgumentError.value(
        end,
        'end',
        'End time must be after start time.',
      );
    }

    // Koko päivän tapahtumat alkavat ja päättyvät
    // vuorokauden vaihtuessa.
    if (isAllDay && (!_isMidnight(start) || !_isMidnight(end))) {
      throw ArgumentError('All-day events must use midnight boundaries.');
    }
  }

  /// Tapahtuman yksilöllinen tunniste.
  final String id;

  /// Tapahtuman otsikko.
  final String title;

  /// Vapaaehtoinen kuvaus.
  /// kysymysmerkki tarkoittaa, että kuvaus voi olla myös null.
  /// Kaikki tapahtumat eivät tarvitse kuvausta.
  final String? description;

  /// Tapahtuman alkamisaika.
  /// DateTime: säilyttää päivämäärän ja kellonajan.
  /// Käytämme sitä myöhemmin tapahtumien järjestämiseen ja kalenteripäivien vertailuun.
  final DateTime start;

  /// Tapahtuman päättymisaika (ei sisälly aikaväliin).
  final DateTime end;

  /// Tapahtuman kategoria.
  final EventCategory category;

  /// Onko kyseessä koko päivän tapahtuma?
  final bool isAllDay;

  /// Tarkistaa, onko annettu aika tasan keskiyö.
  static bool _isMidnight(DateTime date) {
    return date.hour == 0 &&
        date.minute == 0 &&
        date.second == 0 &&
        date.millisecond == 0 &&
        date.microsecond == 0;
  }
}
