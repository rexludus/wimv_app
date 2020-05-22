import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/record.dart';
import '../helpers/helper_db.dart';
import '../helpers/helper_location.dart';

// this is the place where i manage user inputs like title, location and image
class UserInputs with ChangeNotifier {
  List<Record> _items = [];

  List<Record> get items {
    return [..._items]; //... means copy of the _items
  }

  Record findById(String id) {
    return _items.firstWhere((record) => record.id == id);
  }

  Future<void> addRecord(
    String pickedTitle,
    File pickedImage,
    PlaceLocation pickedLocation,
  ) async {
    final address = await HelperLocation.getPlaceAddress(
        pickedLocation.latitude, pickedLocation.longitude);
    final updatedLocation = PlaceLocation(
      latitude: pickedLocation.latitude,
      longitude: pickedLocation.longitude,
      address: address,
    );
    // newRecord is stored in the memory
    final newRecord = Record(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      location: updatedLocation,
    );
    _items.add(newRecord);
    notifyListeners();
    // now newRecord is stored in the internal sd card.
    HelperDB.insert('user_records', {
      'id': newRecord.id,
      'title': newRecord.title,
      'image': newRecord.image.path,
      'loc_lat': newRecord.location.latitude,
      'loc_lng': newRecord.location.longitude,
      'address': newRecord.location.address,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await HelperDB.getData('user_records');
    _items = dataList
        .map(
          (item) => Record(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlaceLocation(
              latitude: item['loc_lat'],
              longitude: item['loc_lng'],
              address: item['address'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }

  // Future<int> delete(String table, String id) async {
  //   final db = await HelperDB.database();
  //   return db.delete(table, where: '$id = ?', whereArgs: [id]);
  // }
}
