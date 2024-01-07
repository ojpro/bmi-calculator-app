import 'package:bmi_calculator/shared/colors/main_palette.dart';
import 'package:bmi_calculator/shared/components/default_text.dart';
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
      color: color ?? MainPalette.blue,
      onPressed: () => onClick(),
      child: defaultText(text: title, fontWeight: FontWeight.w500),
    );
