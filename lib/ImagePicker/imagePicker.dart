import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:important_widgets/ImagePicker/pick.dart';
import 'package:important_widgets/Widgets/ProgressWidgets.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Positioned(
                  child: MaterialButton(
                    color: Colors.lightGreen,
                onPressed: () {
                  _handleURLButtonPress(context, ImageSourceType.gallery);
                },
                child: Text('Pick Image From Gallery', style: TextStyle(color: Colors.white
                ), ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Positioned(
                  child: MaterialButton(
                    color: Colors.lightGreen,
                onPressed: () {
                  _handleURLButtonPress(context, ImageSourceType.camera);
                },
                child: Text('Pick Image From Camera', style: TextStyle(color: Colors.white),),
              )),
            ),
            LinearProgress()
          ],
        ),
      ),
    );
  }
}
