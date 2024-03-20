// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color _pickedColor = Colors.blueGrey;

  get pickedColor => _pickedColor;

  Future<bool> setPickedColor(Color value) async {
    _pickedColor = value;
    notifyListeners();
    return true;
  }
}
