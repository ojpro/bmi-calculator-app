import 'package:bmi_calculator/core/bloc/app_cubit.dart';
import 'package:bmi_calculator/core/common/components/box.dart';
import 'package:bmi_calculator/core/common/components/default_button.dart';
import 'package:bmi_calculator/core/common/components/icon_button.dart';
import 'package:bmi_calculator/core/common/layouts/basic_layout.dart';
import 'package:bmi_calculator/core/common/styles/colors.dart';
import 'package:bmi_calculator/src/bmi/domain/entities/result_entity.dart';
import 'package:bmi_calculator/src/bmi/presentation/bloc/bmi_cubit.dart';
import 'package:bmi_calculator/src/bmi/presentation/bloc/bmi_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      leading: GestureDetector(
        onTap: () => context.read<AppCubit>().changeScreen(const HomeScreen()),
        child: const Icon(Icons.arrow_back_ios_rounded),
      ),
      title: 'Results',
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 4),
          child: iconButton(
            onClick: () {},
            icon: Icons.timeline_outlined,
            iconBackground: ColorsPalette.secondary,
            padding: const EdgeInsets.all(4),
            iconSize: 20,
          ),
        ),
      ],
      child: BlocBuilder<BMICubit, BMIStates>(
        builder: (context, state) {
          late ResultEntity result;
          if (state is BMICalculateResultState) {
            result = state.userInfoEntity.getInterpretation();
          } else {
            result = state.userInfoEntity.getDefaultResult();
          }
          return Column(
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
                        Text(
                          result.message,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              result.score.toStringAsFixed(1),
                              style: const TextStyle(
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
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 24,
                                    horizontal: 24,
                                  ),
                                  borderRadius: 4,
                                  gradientColors: [
                                    result.resultGradient.startColor as Color,
                                    result.resultGradient.endColor as Color,
                                  ],
                                  child: Text(
                                    result.note,
                                    style: const TextStyle(
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
          );
        },
      ),
    );
  }
}
