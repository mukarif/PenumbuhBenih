import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final double h;
  const CustomBox({
    Key key,
    @required this.h,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
    );
  }
}
