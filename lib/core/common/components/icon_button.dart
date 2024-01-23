import 'package:flutter/material.dart';

Widget iconButton({
  required Function onClick,
  required IconData icon,
  Color iconColor = Colors.white,
  Color iconBackground = Colors.grey,
  EdgeInsets? padding,
  double ? iconSize = 24,
}) =>
    IconButton(
      onPressed: () => onClick(),
      enableFeedback: false,
      padding: padding,
      icon: CircleAvatar(
        radius: iconSize,
        backgroundColor: iconBackground,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
