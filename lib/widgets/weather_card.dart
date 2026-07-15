import 'package:flutter/material.dart';

import '../models/weather.dart';
import '../services/weather_service.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  String _description(int code) {
    switch (code) {
      case 0:
        return "Clear";
      case 1:
        return "Mostly Clear";
      case 2:
        return "Partly Cloudy";
      case 3:
        return "Overcast";
      case 61:
        return "Light Rain";
      case 63:
        return "Rain";
      case 80:
        return "Rain Showers";
      case 95:
        return "Thunderstorm";
      default:
        return "Unknown";
    }
  }

  IconData _icon(int code) {
    switch (code) {
      case 0:
        return Icons.wb_sunny;
      case 1:
      case 2:
        return Icons.cloud_queue;
      case 3:
        return Icons.cloud;
      case 61:
      case 63:
      case 80:
        return Icons.umbrella;
      case 95:
        return Icons.flash_on;
      default:
        return Icons.cloud;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather?>(
      future: WeatherService.getWeather(
        latitude: 36.1627, // Nashville
        longitude: -86.7816,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        final weather = snapshot.data!;

        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  _icon(weather.weatherCode),
                  size: 48,
                  color: Colors.orange,
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Current Weather",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Nashville, TN",
                        style: TextStyle(fontSize: 16),
                      ),

                      Text(
                        "${weather.temperature.toStringAsFixed(0)}°F",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(_description(weather.weatherCode)),

                      Text("Wind ${weather.windSpeed.toStringAsFixed(0)} mph"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
