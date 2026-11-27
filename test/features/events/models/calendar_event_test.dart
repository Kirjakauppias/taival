import 'package:flutter_test/flutter_test.dart';

import 'package:taival/features/events/models/calendar_event.dart';
import 'package:taival/features/events/models/event_category.dart';

/// Testit käsittelevät muun muassa tavallisia tapahtumia, koko päivän tapahtumia,
/// keskiyön yli jatkuvia tapahtumia ja virheellisiä syötteitä.
void main() {
  // Apufunktio testitapahtumien luomiseen.
  CalendarEvent createEvent({
    String id = 'event-001',
    String title = 'Työvuoro',
    DateTime? start,
    DateTime? end,
    EventCategory category = EventCategory.workShift,
    String? description,
    bool isAllDay = false,
  }) {
    return CalendarEvent(
      id: id,
      title: title,
      start: start ?? DateTime(2026, 11, 27, 9),
      end: end ?? DateTime(2026, 11, 27, 17),
      category: category,
      description: description,
      isAllDay: isAllDay,
    );
  }

  group('CalendarEvent', () {
    test('Creates a valid event', () {
      final event = createEvent(description: 'Aamuvuoro');

      expect(event.id, 'event-001');
      expect(event.title, 'Työvuoro');
      expect(event.description, 'Aamuvuoro');
      expect(event.category, EventCategory.workShift);
      expect(event.isAllDay, false);
    });

    test('Supports all four categories', () {
      expect(EventCategory.values.length, 4);

      expect(
        EventCategory.values,
        containsAll([
          EventCategory.workShift,
          EventCategory.personalA,
          EventCategory.personalB,
          EventCategory.shared,
        ]),
      );
    });

    test('Description is optional', () {
      final event = createEvent();

      expect(event.description, isNull);
    });

    test('Supports all-day events', () {
      final event = createEvent(
        start: DateTime(2026, 11, 28),
        end: DateTime(2026, 11, 29),
        isAllDay: true,
      );

      expect(event.isAllDay, true);
    });

    test('Supports events crossing midnight', () {
      final event = createEvent(
        start: DateTime(2026, 11, 27, 22),
        end: DateTime(2026, 11, 28, 2),
      );

      expect(event.start.isBefore(event.end), true);
    });

    test('Rejects an empty ID', () {
      expect(() => createEvent(id: '  '), throwsArgumentError);
    });

    test('Rejects an empty title', () {
      expect(() => createEvent(title: '  '), throwsArgumentError);
    });

    test('Rejects invalid time ranges', () {
      expect(
        () => createEvent(
          start: DateTime(2026, 11, 27, 17),
          end: DateTime(2026, 11, 27, 9),
        ),
        throwsArgumentError,
      );

      expect(
        () => createEvent(
          start: DateTime(2026, 11, 27, 9),
          end: DateTime(2026, 11, 27, 9),
        ),
        throwsArgumentError,
      );
    });

    test('Rejects invalid all-day boundaries', () {
      expect(
        () => createEvent(
          start: DateTime(2026, 11, 28, 12),
          end: DateTime(2026, 11, 29),
          isAllDay: true,
        ),
        throwsArgumentError,
      );
    });
  });
}
