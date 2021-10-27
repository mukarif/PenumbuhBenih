import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/page_petani/login/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Penumbuh Benih',
      home: const BackGround(),
      theme: ThemeData(canvasColor: Colors.transparent),
    );
  }
}
