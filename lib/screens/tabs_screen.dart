import 'package:flutter/material.dart';
// import 'package:firebase_admob/firebase_admob.dart';

import '../screens/see_your_locations_screen.dart';
import './add_new_location_screen.dart';

import '../models/my_globals.dart' as globals;

// const String appId = "ca-app-pub-7585936331948140~2620368297";
// const String bannerAdId = "ca-app-pub-7585936331948140/4157359986";

class TabsScreen extends StatefulWidget {
  TabsScreenState createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    globals.tabController = _tabController;
    super.initState();
    // print("initstate tab controller");
  }

  @override
  Widget build(BuildContext context) {
    // FirebaseAdMob.instance.initialize(appId: appId);

    // myBanner
    //   ..load()
    //   ..show();

    return Scaffold(
      appBar: AppBar(
        title: Text('Where is my vehicle?!'),
        centerTitle: false,
        actions: <Widget>[
          Icon(Icons.directions_car),
          Icon(Icons.help_outline),
          Icon(Icons.error_outline)
        ],
        bottom: TabBar(
          controller: _tabController,
          //indicatorColor: Colors.black26,
          tabs: <Widget>[
            Tab(
              text: "add new location",
              icon: Icon(Icons.add),
            ),
            Tab(
              text: "see your locations",
              icon: Icon(Icons.list),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          //put screens here like;
          AddNewLocationScreen(),
          SeeYourLocationsScreen(),
        ],
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

// BannerAd myBanner = BannerAd(
//   // adUnitId: BannerAd.testAdUnitId,
//   adUnitId: bannerAdId,
//   size: AdSize.smartBanner,
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {
//     print("BannerAd event is $event");
//   },
// );
