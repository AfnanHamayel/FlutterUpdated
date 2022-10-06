import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' ;
import 'package:untitled4/screens/edit_profile.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImagePickerScreenState();
  }
}

class ImagePickerScreenState extends State<ImagePickerScreen> {
 File? _ddimage = null;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: _ddimage != null
                ? Image.file(_ddimage!)
                : IconButton(
                    onPressed: () {
                      showOptionChooser();
                    },
                    icon: Icon(Icons.camera))));
  }

  getImage(ImageSource imageSource) async {
    PickedFile? imageFile = await picker.getImage(source: imageSource);
    if (imageFile == null) return;
    setState(
      () {
        _ddimage = File(imageFile.path);
        print(_ddimage);
        
      },
    );
          Navigator.push(context, MaterialPageRoute(builder: (_)=> EditProfile( imageFile: _ddimage!.path,)   ));

  }

  void showOptionChooser() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Please Choose"),
          actions: [
            TextButton(
              child: Text('Camera'),
              onPressed: () {
                Navigator.pop(context);
                getImage(ImageSource.camera);
              },
            ),
            TextButton(
              child: Text('Gallery'),
              onPressed: () {
                Navigator.pop(context);
                getImage(ImageSource.gallery);
              },
            )
          ],
        );
      },
    );
  }
}
