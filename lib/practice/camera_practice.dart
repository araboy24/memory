import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPractice extends StatefulWidget {
  @override
  _CameraPracticeState createState() => _CameraPracticeState();
}

class _CameraPracticeState extends State<CameraPractice> {

  File imageFile;
  // PickedFile

  _openGallery(BuildContext context) async {
    // imageFile = File(await ImagePicker().getImage(source: ImageSource.gallery));
    var picture = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
    setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();

  }

  _openCamera(BuildContext context) async {
    var picture = File(await ImagePicker().getImage(source: ImageSource.camera).then((pickedFile) => pickedFile.path));
    setState(() {
    imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a choice"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _decideImageView() {
    if(imageFile == null){
      return Text("No image selected");
    } else {
      return Image.file(imageFile, width: 400, height: 400,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
      "Camera Practice"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _decideImageView(),
                RaisedButton(onPressed: () {
                  _showChoiceDialog(context);
                },
                child: Text("Select image"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
