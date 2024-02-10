import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class postdrug extends StatefulWidget {
  const postdrug({super.key});

  @override
  State<postdrug> createState() => _postdrugState();
}

class _postdrugState extends State<postdrug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image!),
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () => getImage(ImageSource.camera),
                tooltip: 'Take Photo',
                child: Icon(Icons.camera),
              ),
              SizedBox(height: 16),
              FloatingActionButton(
                onPressed: () => getImage(ImageSource.gallery),
                tooltip: 'Pick Image from Gallery',
                child: Icon(Icons.photo_library),
              ),
            ],
          ),
        ],
      ),

    );
  }
  File? _image;

  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
