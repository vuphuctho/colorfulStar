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

class StarModel extends ChangeNotifier {
  MaterialColor _starColor;
  String _colorName;

  StarModel() {
    var rng = new Random();
    int index = rng.nextInt(starColors.length);
    _colorName = starColors.keys.elementAt(index);
    _starColor = starColors.values.elementAt(index);
  }

  MaterialColor get starColor => _starColor;
  String get text => 'Your lucky star color today is $_colorName';
}