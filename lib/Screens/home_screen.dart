import 'package:flutter/material.dart';
import 'package:task_hashone/Global/global.dart';
import 'package:task_hashone/Screens/eye_detector.dart';
import 'package:task_hashone/Widgets/theme_button.dart';
import 'package:task_hashone/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ThemeButton(
              title: 'Continue',
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (c) => const EyeDetector()));
              },
            ),
          ],
        ),
      ),
    );
  }

  navigateToHome(BuildContext context) {
    myDialogBox(context: context, value: 'Please wait..');

    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (c) => const MyApp()),
          (route) => false,
        );
      },
    );
  }
}
