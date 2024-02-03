import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class postdrug extends StatefulWidget {
  const postdrug({super.key});

  @override
  State<postdrug> createState() => _postdrugState();
}

class _postdrugState extends State<postdrug> {
  TextEditingController _drugNameController = TextEditingController();
  TextEditingController _dosageController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree
    _drugNameController.dispose();
    _dosageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 58.0, left: 30, right: 30),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: _image == null
                    ? Text('No image selected.')
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        // Adjust the value for the desired roundness
                        child: Image.file(
                          _image!,
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                  color: Colors.white60,

              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () => getImage(ImageSource.camera),
                      tooltip: 'Take Photo',
                      child: Icon(Icons.camera),
                    ),
                    SizedBox(height: 16),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () => getImage(ImageSource.gallery),
                      tooltip: 'Pick Image from Gallery',
                      child: Icon(Icons.photo_library),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28),
                child: TextField(
                  controller: _drugNameController,
                  decoration: InputDecoration(
                    labelText: 'Drug Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28),
                child: TextField(
                  controller: _dosageController,
                  decoration: InputDecoration(
                    labelText: 'Dosage',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    ));
  }

  File? _image;

  final picker = ImagePicker();
  Future<void> _uploadData() async {
    String drugName = _drugNameController.text;
    String dosage = _dosageController.text;

    if (_image == null || drugName.isEmpty || dosage.isEmpty) {
      // Ensure all fields are filled
      return;
    }

    Reference storageReference =
    FirebaseStorage.instance.ref().child('images/${DateTime.now().toString()}');
    UploadTask uploadTask = storageReference.putFile(_image!);
    await uploadTask.whenComplete(() => null);
    String imageUrl = await storageReference.getDownloadURL();

    final databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child("medicines").push().set({
      'drugName': drugName,
      'dosage': dosage,
      'imageUrl': imageUrl,
    });

    // Clear the text fields and image after uploading
    _drugNameController.clear();
    _dosageController.clear();
    setState(() {
      _image = null;
    });
  }

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
