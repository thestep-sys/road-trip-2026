import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather.dart';

class WeatherService {
  static Future<Weather?> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast'
      '?latitude=$latitude'
      '&longitude=$longitude'
      '&current=temperature_2m,weather_code,wind_speed_10m'
      '&temperature_unit=fahrenheit'
      '&wind_speed_unit=mph',
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      return null;
    }

    final json = jsonDecode(response.body);

    final current = json['current'];

    return Weather(
      temperature: (current['temperature_2m'] as num).toDouble(),
      weatherCode: current['weather_code'],
      windSpeed: (current['wind_speed_10m'] as num).toDouble(),
    );
  }
}
