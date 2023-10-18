import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_hashone/Widgets/my_dialog.dart';

myPrint({required dynamic value}) {
  if (kDebugMode) {
    print(value);
  }
}

myDialogBox({required BuildContext context, required String value}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => MyDialog(
            message: value,
          ));
}
