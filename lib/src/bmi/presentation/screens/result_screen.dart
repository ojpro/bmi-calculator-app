import 'package:bmi_calculator/core/common/components/box.dart';
import 'package:bmi_calculator/core/common/components/default_button.dart';
import 'package:bmi_calculator/core/common/layouts/basic_layout.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      leading: GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ),
          )
        },
        child: const Icon(Icons.arrow_back_ios_rounded),
      ),
      title: 'Results',
      centerTitle: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 36, horizontal: 20),
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8, bottom: 64, left: 20, right: 20),
              child: boxComponent(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'value',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        // color: Color(InterpretationType.color),
                        color: Colors.green,
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'score',
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    const Text(
                      'Normal BMI range:',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      '18.5 - 24.9 kg/m2',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
                            child: boxComponent(
                              // color: Color(InterpretationType.color),
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                vertical: 24,
                                horizontal: 24,
                              ),
                              borderRadius: 4,
                              child: const Text(
                                'note',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
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
          ),
        ],
      ),
    );
  }
}
