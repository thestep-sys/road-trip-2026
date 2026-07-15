import 'package:url_launcher/url_launcher.dart';

class NavigationService {
  NavigationService._();

  static Future<bool> openGoogleMaps({
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );

    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static Future<bool> openWaze({
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.parse(
      'https://waze.com/ul?ll=$latitude,$longitude&navigate=yes',
    );

    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
