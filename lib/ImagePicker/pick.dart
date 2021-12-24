import 'dart:io';

import 'package:flutter/material.dart';
 import 'package:image_picker/image_picker.dart';
import 'package:important_widgets/ImagePicker/imagePicker.dart';

class ImageFromGallery extends StatefulWidget {
  final type;
  ImageFromGallery(this.type);
  @override
  _ImageFromGalleryState createState() => _ImageFromGalleryState(this.type);
}

class _ImageFromGalleryState extends State<ImageFromGallery> {
  var _image;
  var imagePicker;
  var type;
  _ImageFromGalleryState(this.type);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker= IImagePicker();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(type==ImageSourceType.camera ? 'Image From Camera' : 'Image From Gallery'),
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: ()async {
                var source = type == ImageSourceType.camera ? ImageSource.camera : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                  source : source, imageQuality: 50, preferredCameraDevice: CameraDevice.front
                );
                setState(() {
                  _image = File(image.path);
                });
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                ),
                child: _image != null ? Image.file(_image, width: 200, height: 200, fit: BoxFit.fitWidth,)
                    : Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,),
                    width: 200,
                    height: 200,
                    child : Icon(
                      Icons.camera


                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
