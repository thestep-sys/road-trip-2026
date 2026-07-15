import 'package:flutter/material.dart';

import '../data/trip_data.dart';
import '../widgets/stop_card.dart';

class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Road Trip Itinerary')),
      body: ListView.builder(
        itemCount: tripDays.length,
        itemBuilder: (context, dayIndex) {
          final day = tripDays[dayIndex];

          return ExpansionTile(
            initiallyExpanded: dayIndex == 0,
            title: Text(
              day.date,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(day.title),
            children: day.stops.map((stop) => StopCard(stop: stop)).toList(),
          );
        },
      ),
    );
  }
}
