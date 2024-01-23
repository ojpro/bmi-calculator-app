import 'package:bmi_calculator/core/bloc/app_cubit.dart';
import 'package:bmi_calculator/core/common/components/default_button.dart';
import 'package:bmi_calculator/core/common/components/icon_button.dart';
import 'package:bmi_calculator/core/common/layouts/basic_layout.dart';
import 'package:bmi_calculator/core/common/styles/colors.dart';
import 'package:bmi_calculator/src/bmi/domain/entities/user_info_entity.dart';
import 'package:bmi_calculator/src/bmi/presentation/bloc/bmi_cubit.dart';
import 'package:bmi_calculator/src/bmi/presentation/bloc/bmi_states.dart';
import 'package:bmi_calculator/src/bmi/presentation/screens/about_screen.dart';
import 'package:bmi_calculator/src/bmi/presentation/widgets/select_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'result_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BasicLayout(
      showBackButton: false,
      title: 'BMI Calculator',
      centerTitle: true,
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: () {
                  appCubit.changeScreen(const AboutScreen());
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.info,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Text(
                        'About',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          enableFeedback: false,
          position: PopupMenuPosition.under,
        ),
      ],
      child: BlocConsumer<BMICubit, BMIStates>(
        listener: (context, state) {},
        builder: (context, state) {
          BMICubit bmiCubit = BMICubit.get(context);

          UserInfoEntity userInfo = state.userInfoEntity;

          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 24,
                  horizontal: 14,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: selectCardWidget(
                        name: 'MALE',
                        imageSrc: 'assets/images/male-icon.png',
                        enabled: userInfo.gender == 'male',
                        enabledBorderColor: ColorsPalette.blue,
                        disabledBorderColor: Colors.transparent,
                        enabledTextColor: Colors.white,
                        disabledTextColor: Colors.grey.shade700,
                        onTap: (enabled) {
                          bmiCubit.changeUserInfo(gender: 'male');
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: selectCardWidget(
                        name: 'FEMALE',
                        imageSrc: 'assets/images/female-icon.png',
                        enabled: userInfo.gender == 'female',
                        enabledBorderColor: ColorsPalette.blue,
                        disabledBorderColor: Colors.transparent,
                        enabledTextColor: Colors.white,
                        disabledTextColor: Colors.grey.shade700,
                        onTap: (enabled) {
                          bmiCubit.changeUserInfo(gender: 'female');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 14,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsPalette.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 36,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                            ),
                            child: Row(
                              children: [
                                iconButton(
                                  onClick: () => {
                                    if (userInfo.height.floor() > 80.0)
                                      bmiCubit.changeUserInfo(
                                          height: userInfo.height - 1)
                                  },
                                  icon: Icons.remove,
                                  iconBackground: ColorsPalette.greyBackground,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        userInfo.height.toStringAsFixed(0),
                                        style: const TextStyle(
                                          fontSize: 48,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Text(
                                        'cm',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                iconButton(
                                  onClick: () => {
                                    if (userInfo.height.ceil() < 250.0)
                                      bmiCubit.changeUserInfo(
                                          height: userInfo.height + 1)
                                  },
                                  icon: Icons.add,
                                  iconBackground: ColorsPalette.greyBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Slider(
                          min: 80.0,
                          max: 250.0,
                          value: userInfo.height,
                          // value: UserInfo.height,
                          activeColor: ColorsPalette.blue,
                          onChanged: (value) {
                            bmiCubit.changeUserInfo(
                              height: value.ceilToDouble(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 12,
                  horizontal: 14,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsPalette.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              userInfo.weight.toStringAsFixed(0),
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                iconButton(
                                    onClick: () => {
                                          if (userInfo.weight > 0)
                                            bmiCubit.changeUserInfo(
                                                weight: userInfo.weight - 1)
                                        },
                                    icon: Icons.remove,
                                    iconBackground:
                                        ColorsPalette.greyBackground),
                                iconButton(
                                    onClick: () => bmiCubit.changeUserInfo(
                                        weight: userInfo.weight + 1),
                                    icon: Icons.add,
                                    iconBackground:
                                        ColorsPalette.greyBackground),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsPalette.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${userInfo.age}',
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                iconButton(
                                  onClick: () => {
                                    if (userInfo.age > 0)
                                      bmiCubit.changeUserInfo(
                                          age: userInfo.age - 1)
                                  },
                                  icon: Icons.remove,
                                  iconBackground: ColorsPalette.greyBackground,
                                ),
                                iconButton(
                                  onClick: () => bmiCubit.changeUserInfo(
                                      age: userInfo.age + 1),
                                  icon: Icons.add,
                                  iconBackground: ColorsPalette.greyBackground,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              defaultButton(
                title: 'CALCULATE',
                onClick: () {
                  appCubit.changeScreen(const ResultScreen());
                  bmiCubit.calculateResult();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
