import 'package:bmi_calculator/shared/components/default_text.dart';
import 'package:flutter/material.dart';
import '../colors/main_palette.dart';

Widget defaultLayout({required String title, required Widget slot}) => SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MainPalette.primary,
          automaticallyImplyLeading: false,
          title: defaultText(
            text: title,
            fontSize: 20,
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: MainPalette.secondary,
          child: slot,
        ),
      ),
    );