import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:important_widgets/Widgets/clip.dart';

class ProductRating extends StatefulWidget {
  const ProductRating({Key? key}) : super(key: key);

  @override
  _ProductRatingState createState() => _ProductRatingState();
}

class _ProductRatingState extends State<ProductRating> {
  double _ratingValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Rating'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Colors.deepOrange,
                    height: 50,
                    width: 200,
                    child: Center(
                        child: Text(
                      'Rate Our App',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          backgroundColor: Colors.deepOrange),
                    ))),
              ),
              SizedBox(
                height: 25,
              ),
              RatingBar(
                initialRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                    full: Icon(
                      Icons.star,
                      color: Colors.green,
                    ),
                    half: Icon(
                      Icons.star_half,
                      color: Colors.green,
                    ),
                    empty: Icon(
                      Icons.star_border,
                      color: Colors.white,
                    )),
                onRatingUpdate: (value) {
                  setState(() {
                    _ratingValue = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  width: 75,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.rectangle,
                      gradient: LinearGradient(colors: [
                        Colors.yellowAccent,
                        Colors.deepOrangeAccent
                      ], end: Alignment.topLeft, begin: Alignment.bottomRight)),
                  alignment: Alignment.center,
                  child: Text(
                    _ratingValue != null ? _ratingValue.toString() : 'Rate it!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
