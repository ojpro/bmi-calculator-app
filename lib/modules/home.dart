import 'package:bmi_calculator/models/user_info.dart';
import 'package:bmi_calculator/modules/result.dart';
import 'package:bmi_calculator/shared/colors/main_palette.dart';
import 'package:bmi_calculator/shared/components/buttons/default_button.dart';
import 'package:bmi_calculator/shared/components/default_text.dart';
import 'package:bmi_calculator/shared/components/buttons/icon_button.dart';
import 'package:bmi_calculator/shared/components/form/select_card.dart';
import 'package:bmi_calculator/shared/layouts/default_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return defaultLayout(
      title: 'BMI Calculator',
      actions: [
        iconButton(
          onClick: () {},
          icon: Icons.more_vert_outlined,
          iconBackground: Colors.transparent,
        ),
      ],
      slot: Column(
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
                  child: selectCard(
                    name: 'MALE',
                    imageSrc: 'assets/images/male-icon.png',
                    enabled: UserInfo.isMale,
                    enabledBorderColor: MainPalette.blue,
                    disabledBorderColor: Colors.transparent,
                    enabledTextColor: Colors.white,
                    disabledTextColor: Colors.grey.shade700,
                    onTap: (enabled) {
                      setState(() {
                        UserInfo.isMale = true;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: selectCard(
                    name: 'FEMALE',
                    imageSrc: 'assets/images/female-icon.png',
                    enabled: !UserInfo.isMale,
                    enabledBorderColor: MainPalette.blue,
                    disabledBorderColor: Colors.transparent,
                    enabledTextColor: Colors.white,
                    disabledTextColor: Colors.grey.shade700,
                    onTap: (enabled) {
                      setState(() {
                        UserInfo.isMale = false;
                      });
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
                  color: MainPalette.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 36,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    defaultText(
                      text: 'HEIGHT',
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
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
                                      if (UserInfo.height > 80)
                                        {
                                          setState(() {
                                            UserInfo.height -= 1;
                                          })
                                        }
                                    },
                                icon: Icons.remove,
                                iconBackground: MainPalette.greyBackground),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  defaultText(
                                      text: '${UserInfo.height.toInt()}',
                                      fontSize: 48,
                                      fontWeight: FontWeight.w600),
                                  defaultText(
                                      text: 'cm',
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ],
                              ),
                            ),
                            iconButton(
                                onClick: () => {
                                      if (UserInfo.height < 250)
                                        {
                                          setState(() {
                                            UserInfo.height += 1;
                                          })
                                        }
                                    },
                                icon: Icons.add,
                                iconBackground: MainPalette.greyBackground),
                          ],
                        ),
                      ),
                    ),
                    Slider(
                      min: 80.0,
                      max: 250.0,
                      value: UserInfo.height,
                      activeColor: MainPalette.blue,
                      onChanged: (value) {
                        setState(() {
                          UserInfo.height = value;
                        });
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
                      color: MainPalette.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        defaultText(
                            text: 'WEIGHT',
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                        defaultText(
                            text: '${UserInfo.weight}',
                            fontSize: 36,
                            fontWeight: FontWeight.bold),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            iconButton(
                                onClick: () => {
                                      if (UserInfo.weight > 0)
                                        {
                                          setState(() {
                                            UserInfo.weight -= 1;
                                          })
                                        }
                                    },
                                icon: Icons.remove,
                                iconBackground: MainPalette.greyBackground),
                            iconButton(
                                onClick: () => {
                                      setState(() {
                                        UserInfo.weight += 1;
                                      })
                                    },
                                icon: Icons.add,
                                iconBackground: MainPalette.greyBackground),
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
                      color: MainPalette.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        defaultText(
                            text: 'AGE',
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                        defaultText(
                            text: '${UserInfo.age}',
                            fontSize: 36,
                            fontWeight: FontWeight.bold),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            iconButton(
                              onClick: () => {
                                if (UserInfo.age > 0)
                                  {
                                    setState(() {
                                      UserInfo.age -= 1;
                                    })
                                  }
                              },
                              icon: Icons.remove,
                              iconBackground: MainPalette.greyBackground,
                            ),
                            iconButton(
                              onClick: () => {
                                setState(() {
                                  UserInfo.age += 1;
                                })
                              },
                              icon: Icons.add,
                              iconBackground: MainPalette.greyBackground,
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
            onClick: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ResultScreen(),
                ),
              )
            },
          ),
        ],
      ),
    );
  }
}
