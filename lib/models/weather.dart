class Weather {
  final double temperature;
  final int weatherCode;
  final double windSpeed;

  const Weather({
    required this.temperature,
    required this.weatherCode,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: (json['temperature'] as num).toDouble(),
      weatherCode: json['weathercode'],
      windSpeed: (json['windspeed'] as num).toDouble(),
    );
  }
}
