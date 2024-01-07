import 'package:flutter/material.dart';

Widget defaultText({
  required String text,
  Color color = Colors.white,
  FontWeight fontWeight = FontWeight.bold,
  double fontSize = 16.0,
}) =>
    Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
