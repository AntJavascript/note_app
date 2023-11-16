import 'package:flutter/material.dart';

// 自定义组件
import 'package:note_app/Views/Total/components/cell.dart';

class TotalMonthTab extends StatefulWidget {
  const TotalMonthTab({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TotalMonthTabState();
}

class _TotalMonthTabState extends State<TotalMonthTab> {

  List<Map<String, String>> list = [
    {
      "title": "1月",
      "income": "0.0",
      "expend": "0.0",
    },
    {
      "title": "2月",
      "income": "0.0",
      "expend": "0.0",
    },
    {
      "title": "3月",
      "income": "0.0",
      "expend": "0.0",
    },
    {
      "title": "4月",
      "income": "0.0",
      "expend": "0.0",
    }
  ]
     
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: tabs.map((e) {
        return Cell(title: e["title"], income: e["income"], expend: e["expend"]);
      }).toList()
    )
  }
}
