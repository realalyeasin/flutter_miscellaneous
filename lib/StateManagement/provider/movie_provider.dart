import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:important_widgets/StateManagement/models/movie.dart';

final List<Movie> initialData = List.generate(
    50,
    (index) => Movie(
        title: 'Movie $index',
        runtime: '${Random().nextInt(100) + 50} minutes'));

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = initialData;

  List<Movie> get movies => _movies;

  final List<Movie> _myList = [];

  List<Movie> get myList => _myList;

  void addToList(Movie movie) {
    myList.add(movie);
    notifyListeners();
  }

  void removeFromList(Movie movie) {
    myList.remove(movie);
    notifyListeners();
  }
}
