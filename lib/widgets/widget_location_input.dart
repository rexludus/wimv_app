import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../helpers/helper_location.dart';

class WidgetLocationInput extends StatefulWidget {
  final Function onSelectPlace;

  WidgetLocationInput(this.onSelectPlace);

  _WidgetLocationInputState createState() => _WidgetLocationInputState();
}

class _WidgetLocationInputState extends State<WidgetLocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();
      final staticMapImageUrl = HelperLocation.generateLocationPreviewImage(
        latitude: locData.latitude,
        longitude: locData.longitude,
      );
      setState(() {
        _previewImageUrl = staticMapImageUrl;
      });
      // print(locData.latitude);
      // print(locData.longitude);
      widget.onSelectPlace(locData.latitude, locData.longitude);
    } catch (error) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 390,
          width: double.infinity,
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? Text(
                  "No location chosen",
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              label: Text(
                "Current Location",
              ),
              icon: Icon(Icons.location_on),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getCurrentUserLocation,
            ),
          ],
        )
      ],
    );
  }
}
