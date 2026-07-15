enum StopCategory {
  attraction,
  hotel,
  restaurant,
  museum,
  park,
  scenic,
  travel,
}

class TripStop {
  final String name;
  final String city;
  final String address;

  /// Optional scheduled time (example: "10:30 AM")
  final String? time;

  /// Additional information displayed on the card.
  final String notes;

  /// GPS coordinates
  final double latitude;
  final double longitude;

  /// Admission cost, if applicable.
  final double? cost;

  /// True if tickets have already been purchased.
  final bool ticketsPurchased;

  /// Optional phone number.
  final String? phone;

  /// Optional website.
  final String? website;

  /// Type of stop.
  final StopCategory category;

  const TripStop({
    required this.name,
    required this.city,
    required this.address,
    required this.notes,
    required this.latitude,
    required this.longitude,

    this.time,
    this.cost,
    this.ticketsPurchased = false,
    this.phone,
    this.website,
    this.category = StopCategory.attraction,
  });

  bool get hasCoordinates => latitude != 0.0 || longitude != 0.0;

  bool get hasPhone => phone != null && phone!.isNotEmpty;

  bool get hasWebsite => website != null && website!.isNotEmpty;

  bool get isHotel => category == StopCategory.hotel;

  bool get isRestaurant => category == StopCategory.restaurant;
}
