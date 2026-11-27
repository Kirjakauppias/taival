import 'package:flutter_test/flutter_test.dart';

import 'package:taival/features/events/data/sample_event_repository.dart';
import 'package:taival/features/events/models/event_category.dart';

void main() {
  late SampleEventRepository repository;

  setUp(() {
    repository = SampleEventRepository();
  });

  group('SampleEventRepository', () {
    test('Returns all sample events', () {
      final events = repository.getAllEvents();

      expect(events.length, 7);
    });

    test('Contains all four event categories', () {
      final categories = repository
          .getAllEvents()
          .map((event) => event.category)
          .toSet();

      expect(categories, EventCategory.values.toSet());
    });

    test('Returns events in chronological order', () {
      final events = repository.getAllEvents();

      for (var i = 1; i < events.length; i++) {
        expect(events[i - 1].start.isAfter(events[i].start), isFalse);
      }
    });

    test('Returns events for a selected day', () {
      final events = repository.getEventsForDay(DateTime(2026, 11, 30));

      expect(events.length, 1);
      expect(events.first.id, 'work-001');
    });

    test('Returns an empty list for a day without events', () {
      final events = repository.getEventsForDay(DateTime(2026, 12, 20));

      expect(events, isEmpty);
    });

    test('Includes events that cross midnight', () {
      final events = repository.getEventsForDay(DateTime(2026, 12, 12));

      final ids = events.map((event) => event.id);

      expect(ids, contains('work-002'));
    });

    test('Includes multi-day events on each active day', () {
      for (final day in [10, 11, 12]) {
        final events = repository.getEventsForDay(DateTime(2026, 12, day));

        expect(events.map((event) => event.id), contains('shared-002'));
      }
    });

    test('Excludes events on their exclusive end date', () {
      final events = repository.getEventsForDay(DateTime(2026, 12, 13));

      expect(events.map((event) => event.id), isNot(contains('shared-002')));
    });

    test('Retrieves events within a date range', () {
      final events = repository.getEventsInRange(
        DateTime(2026, 12, 1),
        DateTime(2026, 12, 6),
      );

      expect(
        events.map((event) => event.id),
        containsAll(['personal-a-001', 'personal-b-001', 'shared-001']),
      );

      expect(events.length, 3);
    });

    test('Rejects an invalid date range', () {
      expect(
        () => repository.getEventsInRange(
          DateTime(2026, 12, 5),
          DateTime(2026, 12, 1),
        ),
        throwsArgumentError,
      );
    });

    test('Returned event lists cannot be modified', () {
      final events = repository.getAllEvents();

      expect(() => events.clear(), throwsUnsupportedError);
    });
  });
}
