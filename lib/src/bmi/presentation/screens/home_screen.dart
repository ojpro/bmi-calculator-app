import 'package:bmi_calculator/core/common/components/default_button.dart';
import 'package:bmi_calculator/core/common/components/icon_button.dart';
import 'package:bmi_calculator/core/common/layouts/basic_layout.dart';
import 'package:bmi_calculator/core/common/styles/colors.dart';
import 'package:bmi_calculator/src/bmi/presentation/widgets/select_card_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: 'BMI Calculator',
      centerTitle: true,
      child: Column(
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
                    // enabled: UserInfo.isMale,
                    enabled: true,
                    enabledBorderColor: ColorsPalette.blue,
                    disabledBorderColor: Colors.transparent,
                    enabledTextColor: Colors.white,
                    disabledTextColor: Colors.grey.shade700,
                    onTap: (enabled) {
                      // setState(() {
                      //   UserInfo.isMale = true;
                      // });
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
                    // enabled: !UserInfo.isMale,
                    enabledBorderColor: ColorsPalette.blue,
                    disabledBorderColor: Colors.transparent,
                    enabledTextColor: Colors.white,
                    disabledTextColor: Colors.grey.shade700,
                    onTap: (enabled) {
                      // setState(() {
                      //   UserInfo.isMale = false;
                      // });
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
                                // if (UserInfo.height > 80)
                                //   {
                                //     setState(() {
                                //       UserInfo.height -= 1;
                                //     })
                                //   }
                              },
                              icon: Icons.remove,
                              iconBackground: ColorsPalette.greyBackground,
                            ),
                            const Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    '167',
                                    style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
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
                                // if (UserInfo.height < 250)
                                //   {
                                //     setState(() {
                                //       UserInfo.height += 1;
                                //     })
                                //   }
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
                      value: 160,
                      // value: UserInfo.height,
                      activeColor: ColorsPalette.blue,
                      onChanged: (value) {
                        // setState(
                        //   () {
                        //     UserInfo.height = value;
                        //   },
                        // );
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
                        const Text(
                          '63',
                          style: TextStyle(
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
                                      // if (UserInfo.weight > 0)
                                      //   {
                                      //     setState(() {
                                      //       UserInfo.weight -= 1;
                                      //     })
                                      //   }
                                    },
                                icon: Icons.remove,
                                iconBackground: ColorsPalette.greyBackground),
                            iconButton(
                                onClick: () => {
                                      // setState(() {
                                      //   UserInfo.weight += 1;
                                      // })
                                    },
                                icon: Icons.add,
                                iconBackground: ColorsPalette.greyBackground),
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
                        const Text(
                          '21',
                          style: TextStyle(
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
                                // if (UserInfo.age > 0)
                                //   {
                                //     setState(() {
                                //       UserInfo.age -= 1;
                                //     })
                                //   }
                              },
                              icon: Icons.remove,
                              iconBackground: ColorsPalette.greyBackground,
                            ),
                            iconButton(
                              onClick: () => {
                                // setState(() {
                                //   UserInfo.age += 1;
                                // })
                              },
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
            onClick: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => const ResultScreen(),
              //   ),
              // ),
            },
          ),
        ],
      ),
    );
  }
}
