import 'package:flutter/material.dart';

class Utils {

  var messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text){
    if(text == null) return;
    final snackBar =SnackBar(content: Text(text),backgroundColor: Colors.red,);
    GlobalKey<ScaffoldMessengerState>().currentState?..removeCurrentSnackBar()..showSnackBar(snackBar);
  }
}