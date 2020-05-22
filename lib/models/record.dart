import 'dart:io';

import 'package:flutter/foundation.dart';

// will use it in the "see your locations" section to show the open adress of that record's location.
class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });
}

// record data type
class Record {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Record({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
