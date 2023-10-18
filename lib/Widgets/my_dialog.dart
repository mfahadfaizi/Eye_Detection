import 'package:flutter/material.dart';
import 'package:task_hashone/Utils/utils.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // backgroundColor: Colors.black54,
      child: Container(
        // margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
              const SizedBox(
                width: 6.0,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Utils.blackColor),
              ),
              const SizedBox(
                width: 26.0,
              ),
              Flexible(
                child: Text(
                  '$message',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
