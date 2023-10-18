import 'package:flutter/material.dart';
import 'package:task_hashone/Utils/utils.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Utils.blackColor,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Utils.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
