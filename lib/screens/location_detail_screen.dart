import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_inputs.dart';
import './map_screen.dart';

class LocationDetailScreen extends StatelessWidget {
  static const routeName = '/location-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedRecord =
        Provider.of<UserInputs>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedRecord.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 470,
              width: double.infinity,
              child: Image.file(
                selectedRecord.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              selectedRecord.location.address,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              selectedRecord.id.substring(0, 16),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: FlatButton(
                child: Text(
                  "view on map",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                textColor: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      fullscreenDialog: true, //check the difference
                      builder: (ctx) => MapScreen(
                        initialLocation: selectedRecord.location,
                        isSelecting: false,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
