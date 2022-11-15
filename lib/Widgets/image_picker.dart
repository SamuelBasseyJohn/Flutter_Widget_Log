import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Be sure to add to the Pubspec.yaml file, the following dependencies
// * image_picker
// * path_provider
// before then using this piece of code.

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final imagePicker = ImagePicker();

  Future getImageFromCamera() async {
    final cameraImage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(cameraImage!.path);
    });
  }

  Future getImageFromGallery() async {
    final cameraImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    Directory location = Directory(cameraImage!.path);
    setState(() {
      _image = File(cameraImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: Center(
        child: Container(
          child: _image == null
              ? Text("Select an image, or Take a picture")
              : Image.file(_image!),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                getImageFromCamera();
              },
              child: Icon(Icons.camera_alt),
            ),
            FloatingActionButton(
              onPressed: () {
                getImageFromGallery();
              },
              child: Icon(Icons.image),
            )
          ],
        ),
      ),
    );
  }
}
