import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'StateManagement/provider/movie_provider.dart';
import 'homePage.dart';


void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
      child: MyApp(), create: (_) => MovieProvider()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alert Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
