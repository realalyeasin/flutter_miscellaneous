import 'package:flutter/cupertino.dart';

class ItemModel{
  bool expanded;
  String headerItem;
  String description;

  ItemModel({this.expanded: true, required this.headerItem, required this.description,});
}