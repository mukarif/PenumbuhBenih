import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/extra/box.dart';
import 'package:petani/page/login/login.dart';

class BackGround extends StatefulWidget {
  const BackGround({Key key}) : super(key: key);

  @override
  _BackGroundState createState() => _BackGroundState();
}

class _BackGroundState extends State<BackGround> {
  @override
  void initState() {
    super.initState();
    splashStart();
  }

  splashStart() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Get.offAll(() => const LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ImageLogoSplash(),
              CustomBox(h: 10),
              TextUnderLogo(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextUnderLogo extends StatelessWidget {
  const TextUnderLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "penumbuh benih",
          style: TextStyle(
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
              fontSize: 16),
        ),
      ],
    );
  }
}

class ImageLogoSplash extends StatelessWidget {
  const ImageLogoSplash({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/logo_row.png",
      fit: BoxFit.cover,
    );
  }
}
