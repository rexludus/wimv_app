import 'package:flutter/material.dart';
// import 'package:firebase_admob/firebase_admob.dart';

// const String appId = "ca-app-pub-7585936331948140~2620368297";
// const String bannerAdId = "ca-app-pub-7585936331948140/4157359986";
// const String fullscreenAdId = "ca-app-pub-7585936331948140/4329486469";

class WidgetAds extends StatefulWidget {
  _WidgetAdsState createState() => _WidgetAdsState();
}

class _WidgetAdsState extends State<WidgetAds> {
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[],
    ); //expanded 4 w ads
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
//   testDevices: <String>[], // Android emulators are considered test devices
// );

// BannerAd myBanner = BannerAd(
//   // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//   // https://developers.google.com/admob/android/test-ads
//   // https://developers.google.com/admob/ios/test-ads

//   // adUnitId: BannerAd.testAdUnitId,
//   adUnitId: bannerAdId,
//   size: AdSize.smartBanner,
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {
//     print("BannerAd event is $event");
//   },
// );

// InterstitialAd myInterstitial = InterstitialAd(
//   // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//   // https://developers.google.com/admob/android/test-ads
//   // https://developers.google.com/admob/ios/test-ads

//   // adUnitId: InterstitialAd.testAdUnitId,
//   adUnitId: fullscreenAdId,
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {
//     print("InterstitialAd event is $event");
//   },
// );
