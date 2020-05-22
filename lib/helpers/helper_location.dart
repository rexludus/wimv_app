import 'dart:convert';

import 'package:http/http.dart' as http;

// google cloud map api key
const GOOGLE_API_KEY = 'AIzaSyC0BzT-RlIT1HvgG-VGd8AWDQLEPN8vc60';

class HelperLocation {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=18&size=600x600&maptype=hybrid&markers=color:red%7Clabel:V%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY';
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
