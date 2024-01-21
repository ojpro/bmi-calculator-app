import 'package:flutter/material.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final double elevation;
  final Color? backgroundColor;
  final bool showUnselectedLabels;
  final bool enableFeedback;
  final bool showSelectedLabels;
  final Color? unselectedItemColor;
  final Color? selectedItemColor;
  final double iconSize;
  final int currentIndex;
  final Function onTapPressed;

  const BottomNavigationBarComponent({
    super.key,
    required this.items,
    required this.currentIndex,
    this.elevation = 0.0,
    this.enableFeedback = false,
    this.backgroundColor,
    this.showUnselectedLabels = false,
    this.showSelectedLabels = false,
    this.unselectedItemColor,
    this.selectedItemColor,
    this.iconSize = 24,
    required this.onTapPressed,
  });

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      showUnselectedLabels: showUnselectedLabels,
      showSelectedLabels: showSelectedLabels,
      unselectedItemColor: unselectedItemColor,
      selectedItemColor: selectedItemColor,
      iconSize: iconSize,
      currentIndex: currentIndex,
      enableFeedback: enableFeedback,
      items: items,
      onTap: (index) => onTapPressed(index) ?? (index) {},
    );
  }
}