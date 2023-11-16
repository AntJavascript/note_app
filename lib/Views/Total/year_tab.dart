import 'package:flutter/material.dart';

// 自定义组件
import 'package:note_app/Views/Total/components/cell.dart';

class TotalYaerTab extends StatefulWidget {
  const TotalYaerTab({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TotalYaerTabState();
}

class _TotalYaerTabState extends State<TotalYaerTab> {
  List<Map<String, String>> list = [
    {
      "title": "2023年",
      "income": "0.0",
      "expend": "0.0",
    },
    {
      "title": "2022年",
      "income": "0.0",
      "expend": "0.0",
    },
    {
      "title": "2021年",
      "income": "0.0",
      "expend": "0.0",
    }
  ];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((e) {
      return Cell(title: e["title"], income: e["income"], expend: e["expend"]);
    }).toList());
  }
}
