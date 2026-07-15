import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/trip_stop.dart';

class StopCard extends StatelessWidget {
  final TripStop stop;

  const StopCard({super.key, required this.stop});

  Future<void> _openGoogleMaps() async {
    debugPrint("Google Maps button pressed");

    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${stop.latitude},${stop.longitude}',
    );

    debugPrint(uri.toString());

    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);

    debugPrint("Launched: $launched");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stop.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text("📍 ${stop.city}"),

            if (stop.address.isNotEmpty) Text(stop.address),

            const SizedBox(height: 8),

            Text(stop.notes),

            if (stop.cost != null) ...[
              const SizedBox(height: 8),
              Text(
                "Admission: \$${stop.cost!.toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _openGoogleMaps,
                icon: const Icon(Icons.map),
                label: const Text("Open in Google Maps"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
