import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:places_app/helpers/location_helper.dart';
import 'package:places_app/models/place.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace(
    String title,
    File pickedImage,
    PlaceLocation pickedLocation,
  ) async {
    final newAdress = await LocationHelper.getPlaceAdress(
        pickedLocation.latitude, pickedLocation.longtitude);
    final updatedLocation = PlaceLocation(
        latitude: pickedLocation.latitude,
        longtitude: pickedLocation.longtitude,
        adress: newAdress);
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: updatedLocation,
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
        'loc_lat': newPlace.location.latitude,
        'loc_lng': newPlace.location.longtitude,
        'adress': newPlace.location.adress
      },
    );
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
              location: PlaceLocation(
                  latitude: item['loc_lat'],
                  longtitude: item['loc_lng'],
                  adress: item['adress']),
            ))
        .toList();
    notifyListeners();
  }

  Place findById(String id) {
    return _items.firstWhere((place) => place.id == id);
  }
}
