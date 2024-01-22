import 'package:bmi_calculator/core/common/components/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicLayout extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? child;
  final Widget? leading;
  final Color statusBarColor;
  final List<BottomNavigationBarItem>? bottomNavigationBarItems;
  final Function(int)? onBottomNavBarTapPressed;
  final bool? centerTitle;
  final int? bottomNavigationBarCurrentIndex;

  const BasicLayout({
    super.key,
    required this.title,
    this.actions,
    this.child,
    this.statusBarColor = Colors.black,
    this.bottomNavigationBarItems,
    this.onBottomNavBarTapPressed,
    this.centerTitle = false,
    this.bottomNavigationBarCurrentIndex,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: statusBarColor,
          statusBarBrightness: Brightness.dark,
        ),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: leading,
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: centerTitle,
            actions: actions,
          ),
          body: child,
          bottomNavigationBar: bottomNavigationBarItems == null
              ? null
              : BottomNavigationBarComponent(
                  currentIndex: bottomNavigationBarCurrentIndex ?? 0,
                  onTapPressed: (index) => onBottomNavBarTapPressed!(index),
                  items: bottomNavigationBarItems ?? [],
                ),
        ),
      ),
    );
  }
}
