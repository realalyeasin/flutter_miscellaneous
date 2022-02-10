import 'dart:convert';
import 'dart:io';
import 'package:xml/xml.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class WeatherAPI extends StatefulWidget {
  const WeatherAPI({Key? key}) : super(key: key);

  @override
  _WeatherAPIState createState() => _WeatherAPIState();
}

class _WeatherAPIState extends State<WeatherAPI> {
  int temperature = 0;
  String location = 'San Francisco';
  Xml2Json xml2json = Xml2Json();
  void fetchSearch(String input) async {
    final xml =
            'https://www.metaweather.com/api/location/search/?query=$input';
    try {
      var response = await http.get(Uri.parse(xml));
      var result = json.decode(response.body)[0];
      setState(() {
        location = result["title"];
      });
    } catch (err) {
      throw err;
    }
  }

  void onTextFieldSubmitted(String input) {
    fetchSearch(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch and Refresh'),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        width: 300,
        child: Column(
          children: [
            TextField(
                onSubmitted: (String input) {
                  onTextFieldSubmitted(input);
                },
                style: TextStyle(),
                decoration: InputDecoration(
                    hintText: 'Search Location. . .',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(19, 75, 95, 1),
                    ))),
            Text(location.toString())
          ],
        ),
      ),
    );
  }
}
