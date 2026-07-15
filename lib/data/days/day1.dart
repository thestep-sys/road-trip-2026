import '../../models/trip_day.dart';
import '../../models/trip_stop.dart';

final TripDay day1 = TripDay(
  title: "Day 1 - Monday, July 20",
  date: "July 20, 2026",
  stops: [
    TripStop(
      name: "Leave Home",
      city: "Home",
      address: "",
      notes: "Start your Adventure Companion road trip!",
      latitude: 0,
      longitude: 0,
      category: StopCategory.travel,
    ),
    TripStop(
      name: "Stonewall Jackson House",
      city: "Lexington, VA",
      address: "8 E Washington St",
      notes: "Admission \$10 each",
      latitude: 37.7858,
      longitude: -79.4428,
      cost: 10,
      category: StopCategory.museum,
    ),
    TripStop(
      name: "The Tavern",
      city: "Abingdon, VA",
      address: "222 E Main St",
      notes: "Dinner",
      latitude: 36.7096,
      longitude: -81.9773,
      category: StopCategory.restaurant,
    ),
    TripStop(
      name: "Quality Inn & Suites Bristol North",
      city: "Bristol, VA",
      address: "260 Bristol East Rd",
      notes: "Night 1 Hotel",
      latitude: 36.6458,
      longitude: -82.1408,
      category: StopCategory.hotel,
    ),
  ],
);
