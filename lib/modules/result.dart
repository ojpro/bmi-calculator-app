import 'package:bmi_calculator/models/user_info.dart';
import 'package:bmi_calculator/shared/components/default_text.dart';
import 'package:bmi_calculator/shared/layouts/default_layout.dart';
import 'package:flutter/cupertino.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return defaultLayout(
        title: 'BMI RESULT', slot: defaultText(text: '${UserInfo.age}'));
  }
}
