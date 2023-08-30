import 'package:flutter/material.dart';

class LineSpace extends StatelessWidget {
  const LineSpace(
      {super.key,
      this.height = 10,
      this.color = const Color.fromARGB(255, 240, 240, 240)});

  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      color: color,
    );
  }
}
