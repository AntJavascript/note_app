import 'package:flutter/material.dart';
import "package:flutter_vantui/flutter_vantui.dart";

class TotalInfo extends StatelessWidget {
  const TotalInfo({
    super.key,
    this.title = '',
    this.value = '',
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return const VanCellGroup(children: [
      VanCell(title: "今天", value: "62.65", label: "2023-07-25"),
      VanCell(title: "本周", value: "125.3", label: "2023-07-24 ~ 2023-07-30"),
      VanCell(title: "本月", value: "952", label: "2023-07"),
      VanCell(title: "本年", value: "6598.54", label: "2023"),
    ]);
  }
}
