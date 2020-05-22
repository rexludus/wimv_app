import 'package:flutter/material.dart';
import 'package:layout_samples/screens/location_detail_screen.dart';
import 'package:provider/provider.dart';

import './screens/tabs_screen.dart';
import './providers/user_inputs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UserInputs(),
      child: MaterialApp(
          title: 'Where is my vehicle?!',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            accentColor: Colors.white,
          ),
          home: TabsScreen(),
          routes: {
            LocationDetailScreen.routeName: (ctx) => LocationDetailScreen(),
          }),
    );
  }
}
