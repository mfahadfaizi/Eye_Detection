import 'package:flutter/material.dart';
import 'package:task_hashone/Global/global.dart';
import 'package:task_hashone/Widgets/theme_button.dart';
import 'package:task_hashone/main.dart';

class EndPage extends StatefulWidget {
  const EndPage({super.key});

  @override
  State<EndPage> createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Complete'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.4,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/TY.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ThemeButton(
            title: "Done!",
            onTap: () {
              navigateToHome();
            },
          )
        ],
      ),
    );
  }

  navigateToHome() {
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
