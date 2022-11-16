import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_flutter_widgets/Hero/floating_button.dart';

// Be sure to add to the Pubspec.yaml file, the following dependencies
// * image_picker
// * path_provider
// before then using this piece of code.

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
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
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: Center(
        child: Container(
          child: _image == null
              ? const Text("Select an image, or Take a picture")
              : Image.file(_image!),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                getImageFromCamera();
              },
              child: const Icon(Icons.camera_alt),
            ),
            MyFloatingButton(
              child: const Icon(Icons.browse_gallery),
              onTap: () {
                getImageFromGallery();
              },
            )
          ],
        ),
      ),
    );
  }
}
