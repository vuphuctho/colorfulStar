import 'dart:math';

import 'package:colorful_star/fcm_config.dart';
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
  bool _isFromFCM = false;

  StarModel() {
    var rng = new Random();
    int index = rng.nextInt(starColors.length);
    _colorName = starColors.keys.elementAt(index);
    _starColor = starColors.values.elementAt(index);

    FCMConfiguration.init();
    FCMConfiguration.attachListener(this.onFCMReceived);
  }

  void onFCMReceived(Map<String, dynamic> message) {
    try {
      var color = message['notification']['body'];
      if (starColors.containsKey(color)) {
        _isFromFCM = true;
        _colorName = color;
        _starColor = starColors[color];
        notifyListeners();
      }
    } catch (e) {

    }
  }

  MaterialColor get starColor => _starColor;
  String get text => _isFromFCM ?
    'You have received $_colorName as your lucky star color today' :
    'Your lucky star color today is $_colorName';
}