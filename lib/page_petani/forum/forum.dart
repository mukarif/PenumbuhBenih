import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForumPetani extends StatefulWidget {
  const ForumPetani({Key key}) : super(key: key);

  @override
  _ForumPetaniState createState() => _ForumPetaniState();
}

class _ForumPetaniState extends State<ForumPetani> {
  GlobalKey<FormState> formLahan = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          height: Get.height * 0.9,
          width: Get.width,
          child: const Center(
            child: Text(
              "Forum akan ditampilkan pada update yang mendatang",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ));
  }
}
