// ignore: file_names
import 'package:flutter/material.dart';

class IncomeOrExpenditure extends StatelessWidget {
  const IncomeOrExpenditure({
    super.key,
    this.value = '',
    this.color = const Color.fromARGB(255, 238, 16, 0),
  });

  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    const double fontSize = 11.0;
    return RichText(
      text: TextSpan(
        text: value,
        style: TextStyle(color: color, fontSize: fontSize),
      ),
    );
  }
}
