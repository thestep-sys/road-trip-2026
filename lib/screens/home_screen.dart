import 'package:flutter/material.dart';

import '../services/trip_service.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todayStop = TripService.getTodayHighlight();
    final hotel = TripService.getTonightHotel();

    return Scaffold(
      appBar: AppBar(title: const Text('Adventure Companion')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🌲 Adventure Companion',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Road Trip 2026',
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'July 20 – July 29, 2026',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const WeatherCard(),

            const SizedBox(height: 24),

            Card(
              child: ListTile(
                leading: const Icon(Icons.place, color: Colors.green),
                title: const Text("Today's Adventure"),
                subtitle: Text(
                  todayStop == null
                      ? 'No stop scheduled'
                      : '${todayStop.name}\n${todayStop.city}',
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.hotel, color: Colors.indigo),
                title: const Text("Tonight's Hotel"),
                subtitle: Text(
                  hotel == null
                      ? 'No hotel scheduled'
                      : '${hotel.name}\n${hotel.city}',
                ),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.route, color: Colors.orange),
                title: Text('Trip Progress'),
                subtitle: Text('Day 1 of 10'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
