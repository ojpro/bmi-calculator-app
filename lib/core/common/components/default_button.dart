import 'package:bmi_calculator/core/common/styles/colors.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  required String title,
  required Function onClick,
  Color? color,
  double width = double.infinity,
}) =>
    MaterialButton(
      minWidth: width,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      color: color ?? ColorsPalette.blue,
      onPressed: () => onClick(),
      child: Text(title),
    );
