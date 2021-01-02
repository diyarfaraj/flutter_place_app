const GOOGLE_API_KEY = 'AIzaSyDMvaOaqT_qyp1dLCfSdsnuSahPucEwb2c';

class LocationHelper {
  static String generateLocationPreviewImage({double lat, double long}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat, $long&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$long&key=$GOOGLE_API_KEY';
  }
}
