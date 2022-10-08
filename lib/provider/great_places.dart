import 'dart:io';

import 'package:advantureing_app/helper/db_helper.dart';
import 'package:advantureing_app/helper/location_helper.dart';

import '../models/place.dart';
import 'package:flutter/cupertino.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(String id){
    return _items.firstWhere((place) => place.id==id);
  }

  Future<void> addPlace(String pickedtitle, File PickedImage,
      PlaceLocation pickedLocation) async {
    final address = await LocationHelper.getLocationAddress(
        pickedLocation.latitude, pickedLocation.longitude);
    final updatedAddress = PlaceLocation(
        latitude: pickedLocation.latitude,
        longitude: pickedLocation.longitude,
        address: address);
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: PickedImage,
        location: updatedAddress,
        title: pickedtitle);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location!.latitude,
      'loc_lng': newPlace.location!.longitude,
      'address': newPlace.location!.address.toString(),
    });
  }

  Future<void> fatchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (dbitem) => Place(
            id: dbitem['id'],
            title: dbitem['title'],
            image: File(dbitem['image']),
            location: PlaceLocation(
              latitude: dbitem['loc_lat'],
              longitude: dbitem['loc_lng'],
              address: dbitem['address'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
