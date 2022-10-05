import 'dart:io';

import 'package:advantureing_app/helper/db_helper.dart';

import '../models/place.dart';
import 'package:flutter/cupertino.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedtitle, File PickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: PickedImage,
        location: null,
        title: pickedtitle);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image' : newPlace.image
    });
  }
}
