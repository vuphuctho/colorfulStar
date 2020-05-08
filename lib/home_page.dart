import 'dart:math';

import 'package:flutter/material.dart';

final Map<String, MaterialColor> starColors  = {
  "blue": Colors.blue,
  "green": Colors.green,
  "red": Colors.red,
  "yellow": Colors.yellow,
  "orange": Colors.orange,
  "pink": Colors.pink,
  "purple": Colors.purple
};

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MaterialColor _starColor;
  String _colorName;

  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    int index = rng.nextInt(starColors.length);
    _colorName = starColors.keys.elementAt(index);
    _starColor = starColors.values.elementAt(index);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Icon(Icons.star,
              color: _starColor,
              size: 80.0,
            ),
            Text('Your lucky star color today is $_colorName',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]
        )
      )
    );
  }
  
}