import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:firebase_admob/firebase_admob.dart';

import '../models/record.dart';

// const String appId = "ca-app-pub-7585936331948140~2620368297";
// const String fullscreenAdId = "ca-app-pub-7585936331948140/4329486469";

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapScreen(
      {this.initialLocation =
          const PlaceLocation(latitude: 37.422, longitude: -122.084),
      this.isSelecting = false});

  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    // FirebaseAdMob.instance.initialize(appId: appId);

    // myBanner
    //   ..load()
    //   ..show();

    // myInterstitial
    //   ..load()
    //   ..show(
    //     anchorType: AnchorType.bottom,
    //     anchorOffset: 0.0,
    //     horizontalCenterOffset: 0.0,
    //   );
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 18,
        ),
        markers: {
          Marker(
            markerId: MarkerId('yk'),
            position: LatLng(
              widget.initialLocation.latitude,
              widget.initialLocation.longitude,
            ),
          ),
        },
      ),
    );
  }
}

// MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//   keywords: <String>[
//     'rent a car',
//     'park',
//     'araba kiralama',
//     'araba yıkama',
//     'araba',
//     'motor',
//     'motorsiklet'
//   ],
//   childDirected: false,
// );

// InterstitialAd myInterstitial = InterstitialAd(
//   // adUnitId: InterstitialAd.testAdUnitId,
//   adUnitId: fullscreenAdId,
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {
//     print("InterstitialAd event is $event");
//   },
// );
