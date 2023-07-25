import 'package:flutter/material.dart';

class RecordList extends StatelessWidget {
  const RecordList({
    super.key,
    this.title = '',
    this.value = '',
    this.color = const Color.fromARGB(255, 238, 16, 0),
  });

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    const double fontSize = 12.0;
    return RichText(
      text: TextSpan(
          text: title,
          style: const TextStyle(color: Colors.grey, fontSize: fontSize),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(color: color, fontSize: fontSize),
            ),
          ]),
    );
  }
}
