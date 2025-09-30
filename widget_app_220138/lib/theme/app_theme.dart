import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.purple,
  Colors.yellow,
  Colors.red,
  Colors.lightGreen,
  Colors.blueAccent,
  Colors.pink,
  Colors.pinkAccent,
  Colors.white,
  Colors.green,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;
  const AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0,
        'La posición del color seleccionado debe ser mayor a 0',
      ),
      assert(
        selectedColor < colorList.length,
        'La posición del color seleccionado no debe de ser superior al tamaño de la lista',
      );
  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: colorList[selectedColor]);
}
