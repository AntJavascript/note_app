import 'package:flutter/material.dart';

class LineSpace extends StatelessWidget {
  const LineSpace(this.height, {super.key});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 240, 240, 240)),
    );
  }
}
