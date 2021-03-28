import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraPractice2 extends StatefulWidget {
  @override
  _CameraPractice2State createState() => _CameraPractice2State();
}

class _CameraPractice2State extends State<CameraPractice2> {
  File _image;
  final imagePicker = ImagePicker();
  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null ? Text("no image") : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.camera_alt),
        onPressed: getImage,
      ),
    );
  }
}
