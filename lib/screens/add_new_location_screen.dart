import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_inputs.dart';

import '../widgets/widget_location_input.dart';
import '../widgets/widget_camera.dart';

import '../models/record.dart';
import '../models/my_globals.dart' as globals;

class AddNewLocationScreen extends StatefulWidget {
  _AddNewLocationScreenState createState() => _AddNewLocationScreenState();
}

class _AddNewLocationScreenState extends State<AddNewLocationScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;
  PlaceLocation _pickedLocation;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat, double lng) {
    _pickedLocation = PlaceLocation(latitude: lat, longitude: lng);
  }

  // check if title and location is null.. image is going to be optional.
  // check the video if any problem happens lecture: 290 on 4:00
  void _alarmSnackBar() {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Please fill in all fields!"),
      backgroundColor: Colors.red,
    ));
  }

  void _saveEntry() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _pickedLocation == null) {
      return _alarmSnackBar();
    }
    Provider.of<UserInputs>(context, listen: false)
        .addRecord(_titleController.text, _pickedImage, _pickedLocation);
    //go to second tab
    //destroy the first tab entries
    globals.tabController.animateTo(1);
    print("ANIMATE TO 1");
    var _nameHolder = _titleController.text;
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("$_nameHolder saved.")));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10,
          ),
          // WidgetNote(),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(0),
                // height: 60,
                // width: 300,
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.note_add),
                    //labelText: "Enter the notes *Optional",
                    hintText: "red floor A7, near the tree, etc...",
                    //border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          WidgetLocationInput(_selectPlace),
          SizedBox(
            height: 15,
          ),
          WidgetCamera(_selectImage),
          //WidgetMap(), cancel it, delete it... DESTROY IT!
          // WidgetAds(),
          // WidgetSaveButton(),
          Container(
            // margin: EdgeInsets.only(bottom: 89),
            padding: EdgeInsets.all(0),
            // height: 60,
            // width: 300,
            child: SizedBox(
              height: 40,
              child: RaisedButton.icon(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: _saveEntry, // assign a func
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                elevation: 0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
