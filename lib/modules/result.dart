import 'package:bmi_calculator/models/interpretation.dart';
import 'package:bmi_calculator/models/user_info.dart';
import 'package:bmi_calculator/modules/home.dart';
import 'package:bmi_calculator/shared/colors/main_palette.dart';
import 'package:bmi_calculator/shared/components/buttons/default_button.dart';
import 'package:bmi_calculator/shared/components/buttons/icon_button.dart';
import 'package:bmi_calculator/shared/components/default_text.dart';
import 'package:bmi_calculator/shared/components/elements/box.dart';
import 'package:bmi_calculator/shared/layouts/default_layout.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double score = UserInfo.calculateBMIScore();
    InterpretationType.interpret(score);

    return defaultLayout(
      title: 'BMI RESULT',
      leading: iconButton(
          onClick: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const HomeScreen(),
                  ),
                )
              },
          icon: Icons.arrow_back_ios_rounded,
          iconBackground: Colors.transparent),
      slot: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
            child: defaultText(
                text: 'Your Result', fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, bottom: 64, left: 20, right: 20),
              child: box(
                slot: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    defaultText(
                      text: InterpretationType.value,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(InterpretationType.color),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultText(
                            text: score.toStringAsFixed(1),
                            fontSize: 64,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    defaultText(
                        text: 'Normal BMI range:',
                        color: Colors.grey,
                        fontSize: 18),
                    defaultText(
                        text: '18.5 - 24.9 kg/m2', fontWeight: FontWeight.w600),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: box(
                              color: Color(InterpretationType.color),
                              padding: const EdgeInsets.symmetric(
                                vertical: 24,
                                horizontal: 24,
                              ),
                              slot: defaultText(
                                text: InterpretationType.note,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          defaultButton(
              title: 'RE-CALCULATE',
              onClick: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScreen(),
                      ),
                    )
                  },
              color: MainPalette.blue),
        ],
      ),
    );
  }
}
