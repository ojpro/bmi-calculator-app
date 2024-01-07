import 'package:flutter/material.dart';

import '../../colors/main_palette.dart';
import '../default_text.dart';

Widget selectCard({
  required String name,
  String imageSrc = '',
  Color enabledTextColor = Colors.white,
  Color disabledTextColor = Colors.grey,
  Color enabledBorderColor = Colors.white,
  Color disabledBorderColor = Colors.grey,
  bool enabled = false,
  required Function onTap,
}) =>
    GestureDetector(
      onTap: () => onTap(enabled),
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 24,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: enabled ? enabledBorderColor : disabledBorderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
          color: MainPalette.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 82,
              image: AssetImage(
                imageSrc,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            defaultText(
              text: name,
              color: enabled ? enabledTextColor : disabledTextColor,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
