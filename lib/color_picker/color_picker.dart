// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_state_managements/color_picker/widget/color_body.dart';
import 'package:flutter_state_managements/helpers/color_provider.dart';
import 'package:provider/provider.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final String lopsuim =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  colorDialog() {
    showDialog(
      context: context,
      builder: (context) => ColorBody(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Theme Provider Example',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Montserrat",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Icon(Icons.bubble_chart)
          ],
        ),
        centerTitle: true,
        backgroundColor:
            Provider.of<ColorProvider>(context, listen: true).pickedColor,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Text',
                  style: TextStyle(
                    color: Provider.of<ColorProvider>(context, listen: true)
                        .pickedColor,
                    fontFamily: "Montserrat",
                    fontSize: 80,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  lopsuim,
                  style: TextStyle(
                    color: Provider.of<ColorProvider>(context, listen: true)
                        .pickedColor,
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlue,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    colorDialog();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) =>
                        Provider.of<ColorProvider>(context, listen: true)
                            .pickedColor),
                  ),
                  child: Text(''),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Slider.adaptive(
                value: 0.2,
                onChanged: (value) {},
                activeColor: Provider.of<ColorProvider>(context, listen: true)
                    .pickedColor,
                inactiveColor: Provider.of<ColorProvider>(context, listen: true)
                    .pickedColor,
                thumbColor: Provider.of<ColorProvider>(context, listen: true)
                    .pickedColor,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Switch.adaptive(
                    value: true,
                    onChanged: (value) {},
                    activeColor:
                        Provider.of<ColorProvider>(context, listen: true)
                            .pickedColor,
                    activeTrackColor:
                        Provider.of<ColorProvider>(context, listen: true)
                            .pickedColor,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget colorBody() {
  return AlertDialog();
}
