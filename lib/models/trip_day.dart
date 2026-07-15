import 'trip_stop.dart';

class TripDay {
  final String title;
  final String date;
  final List<TripStop> stops;

  const TripDay({required this.title, required this.date, required this.stops});

  int get stopCount => stops.length;
}
