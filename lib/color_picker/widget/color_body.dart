// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_state_managements/helpers/color_provider.dart';
import 'package:provider/provider.dart';

class ColorBody extends StatefulWidget {
  const ColorBody({super.key});

  @override
  State<ColorBody> createState() => _ColorBodyState();
}

class _ColorBodyState extends State<ColorBody> {
  // create some values
  Color pickerColor = Color(0xff443a49);

  Color currentColor = Color(0xff443a49);

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
    Provider.of<ColorProvider>(context, listen: false).setPickedColor(color);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: pickerColor,
          onColorChanged: changeColor,
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text('close'),
          onPressed: () {
            setState(() => currentColor = pickerColor);

            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
