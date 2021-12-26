import 'package:flutter/material.dart';
CircuarProgress(){
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(5),
    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.black)),
  );
}

LinearProgress(){
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(5),
    child: LinearProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue)),
  );
}
