import 'dart:io';

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
  }
}
