import 'package:flutter/material.dart';

Widget iconButton({
  required Function onClick,
  required IconData icon,
  Color iconColor = Colors.white,
  Color iconBackground = Colors.grey,
}) =>
    IconButton(
      onPressed: () => onClick(),
      icon: CircleAvatar(
        radius: 24,
        backgroundColor: iconBackground,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
