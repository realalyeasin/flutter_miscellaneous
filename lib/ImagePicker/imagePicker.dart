import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:important_widgets/ImagePicker/pick.dart';

enum ImageSourceType { gallery, camera }
void _handleURLButtonPress(BuildContext context, var type) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ImageFromGallery(type)));
}

class IImagePicker extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<IImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 440,
            bottom: 640,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.redAccent,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.lightGreenAccent,
                )),
          ),
          Positioned(
            left: 160,
              bottom : 30,
              child: MaterialButton(
            onPressed: () {
              _handleURLButtonPress(context, ImageSourceType.gallery);
            },
            child: Text('Pick Image From Gallery', style: TextStyle(backgroundColor: Colors.black
            ), ),
          )),
          Positioned(
              child: MaterialButton(
            onPressed: () {
              _handleURLButtonPress(context, ImageSourceType.camera);
            },
            child: Text('Pick Image From Camera'),
          ))
        ],
      ),
    );
  }
}
