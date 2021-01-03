import 'dart:convert';

import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyDMvaOaqT_qyp1dLCfSdsnuSahPucEwb2c';

class LocationHelper {
  static String generateLocationPreviewImage({double lat, double long}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat, $long&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$long&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAdress(double lat, double long) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$GOOGLE_API_KEY';
    final response = await http.get(url);

    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
