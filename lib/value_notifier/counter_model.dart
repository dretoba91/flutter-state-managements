import 'package:flutter/material.dart';

class CounterModel extends ValueNotifier {
  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  CounterModel(super.value);
  

  void increment() {
    value++;
  }
}
