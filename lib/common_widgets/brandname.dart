import 'package:flutter/material.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Infinity",
        style: TextStyle(color: Colors.black87),
      ),
      Text("Hub", style: TextStyle(color: Colors.pinkAccent))
    ],
  );
}
