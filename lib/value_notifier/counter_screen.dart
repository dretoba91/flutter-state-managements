// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_state_managements/value_notifier/counter_model.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  final counter = CounterModel(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ValueNotifier Demo",
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: counter,
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "You have pushed the button this many times:",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${counter.value}",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      counter.increment();
                    },
                    child: Text(
                      "Increment",
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
