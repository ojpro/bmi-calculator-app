import 'package:bmi_calculator/core/common/components/default_button.dart';
import 'package:bmi_calculator/core/common/layouts/basic_layout.dart';
import 'package:bmi_calculator/core/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      title: 'About this app',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'BMI Calculator',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Version 1.1.2',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Card(
                color: ColorsPalette.secondary,
                elevation: 5,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'A simple and intuitive BMI Calculator app to help you track your health.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              defaultButton(
                width: 200,
                title: 'View Source Code',
                onClick: () => _launchURL(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    Uri url = Uri.parse('https://github.com/ojpro/bmi-calculator-app');

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
