// Kalenterin aloitusnäkymä
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Yläpalkki.
      appBar: AppBar(title: const Text('Taival')),

      // Näkymän varsinainen sisältö.
      body: const Center(child: Text('Yhteinen kalenteri rakentuu tänne.')),
    );
  }
}
