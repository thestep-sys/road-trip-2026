import '../data/trip_data.dart';
import '../models/trip_day.dart';
import '../models/trip_stop.dart';

class TripService {
  TripService._();

  static TripDay getCurrentTripDay() {
    // For now, always return Day 1.
    // Later we'll calculate this from today's date.
    return tripDays.first;
  }

  static TripStop? getTodayHighlight() {
    final day = getCurrentTripDay();

    for (final stop in day.stops) {
      if (!stop.isHotel) {
        return stop;
      }
    }

    return null;
  }

  static TripStop? getTonightHotel() {
    final day = getCurrentTripDay();

    for (final stop in day.stops) {
      if (stop.isHotel) {
        return stop;
      }
    }

    return null;
  }
}
