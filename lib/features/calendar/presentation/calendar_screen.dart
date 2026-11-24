import 'package:flutter/material.dart';

/// Taivalin kalenterinäkymä.
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Yhteinen kalenteri rakentuu tänne.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
