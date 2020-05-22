import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class WidgetCamera extends StatefulWidget {
  final Function onSelectImage;

  WidgetCamera(this.onSelectImage);

  _WidgetCameraState createState() => _WidgetCameraState();
}

class _WidgetCameraState extends State<WidgetCamera> {
  File _storedImage;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1080,
      maxHeight: 1920,
    );
    if(imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path
        .basename(imageFile.path); // get image file from name where it stores
    final savedImage = await imageFile.copy(
        '${appDir.path}/$fileName'); // copy the file into this file and keep the file name
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          // width: 150,
          height: 500, //500
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  "No Image Taken",
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          child: SizedBox(
            height: 50,
            child: FlatButton.icon(
              icon: Icon(
                Icons.camera,
                color: Theme.of(context).primaryColor,
              ),
              label: Text(
                "Take Picture",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              // color: Colors.red,
              onPressed: _takePicture, // assign a func, open camera
            ),
          ),
        ),
      ],
    ); //expanded 2 w button and image
  }
}
