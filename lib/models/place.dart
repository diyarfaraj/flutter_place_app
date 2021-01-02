import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocation {
  final double latitude;
  final double longtitude;
  final String adress;

  const PlaceLocation(
      {@required this.latitude, @required this.longtitude, this.adress});
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
