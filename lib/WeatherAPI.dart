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
  Xml2Json xml2json = Xml2Json();
  Future<String> fetchSearch () async {
    final xml = XmlDocument.parse(
        'http://api.worldweatheronline.com/premium/v1/weather.ashx?key=2647b9bcf875426a97c105637220802&q=London&num_of_days=2&tp=3&format=xml')
    as String;
    try {
      var response = await http.get(Uri.parse(xml));
      xml2json.parse(response.body);
      final jsonData = xml2json.toParker();
      String result = jsonDecode(jsonData);
      return result;
    } catch (err) {
      throw err;
    }
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
        child:

        Column(
          children: [
            Text(fetchSearch().toString()),
          ],
        ),


      ),
    );
  }
}
