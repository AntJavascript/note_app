import 'package:flutter/material.dart';

// 自定义组件
import 'DateHead.dart';
import 'item.dart';
import 'common/line_space.dart';
import 'Detail/total_info.dart';

// 日期数据
import 'date.dart';

class DateGrid extends StatefulWidget {
  const DateGrid({Key? key}) : super(key: key);
  @override
  State<DateGrid> createState() => _DateGridState();
}

class _DateGridState extends State<DateGrid> {
  String dateStr = dateFn(DateTime.now())['dateStr']; // r默认当天

  void onClick(String value) {
    setState(() {
      dateStr = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                DateHead(),
                Item(onClick: onClick),
                LineSpace(16.0),
                TotalInfo()
              ],
            ))
      ],
    );
  }
}
