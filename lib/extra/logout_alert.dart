import 'package:petani/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

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
                onPressed: () async {
                  // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  final data = pref.getString('access_token');
                  // ignore: avoid_print
                  print("data token  :: " + data);
                  await pref.remove('access_token');
                  await pref.remove('user_data');
                  // ignore: avoid_print
                  print("revoke token  :: " + data);
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
