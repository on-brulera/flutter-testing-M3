import 'package:flutter/material.dart';

List colores = <Color>[
  Colors.black,
  Colors.white,
  Colors.red,
  Colors.green,
  Colors.transparent
];

class AppTheme {

  final int selectedColor;

  AppTheme({required this.selectedColor})
    :assert(selectedColor >= 0 && selectedColor < colores.length, 'selected color must be 0 - ${colores.length-1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colores[selectedColor],
    appBarTheme: const AppBarTheme(centerTitle: true)
  );
}