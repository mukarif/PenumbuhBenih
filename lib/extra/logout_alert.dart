import 'package:petani/page/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alerts {
  static showAlertDialog(BuildContext context) {
    // show the dialog
    showDialog(
          builder: (context) => AlertDialog(
            title: const Text('Do you want to exit this application?'),
            content: const Text('We hate to see you leave...'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  // ignore: avoid_print
                  print("you choose no");
                  Navigator.of(context).pop(false);
                },
                child: const Text('No'),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  Get.to(() => const LoginPage());
                },
                child: const Text('Yes'),
              ),
            ],
          ),
          context: context,
        ) ??
        false;
  }
}
