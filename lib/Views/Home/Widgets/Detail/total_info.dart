import 'package:flutter/material.dart';
import "package:flutter_vantui/flutter_vantui.dart";
import 'package:tailstyle/tailstyle.dart';

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
    return VanCellGroup(children: [
      VanCell(
          title: TailTypo().font_size(16.0).Text('今天'),
          value:
              TailTypo().font_size(16.0).text_color(Colors.red).Text("62.65"),
          label: "2023年-07月-25日"),
      VanCell(
          title: TailTypo().font_size(16.0).Text("本周"),
          value:
              TailTypo().font_size(16.0).text_color(Colors.red).Text("125.3"),
          label: "07月-24日 - 07月-30日"),
      VanCell(
          title: TailTypo().font_size(16.0).Text("本月"),
          value: TailTypo().font_size(16.0).text_color(Colors.red).Text("952"),
          label: "2023年-07月"),
      VanCell(
          title: TailTypo().font_size(16.0).Text("本年"),
          value:
              TailTypo().font_size(16.0).text_color(Colors.red).Text("6598.54"),
          label: "2023年"),
    ]);
  }
}
