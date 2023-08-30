import 'package:flutter/material.dart';

// 自定义组件
import './week.dart';
import './item.dart';
import './common/line_space.dart';
import './Detail/total_info.dart';
import './record_list.dart';

// 日期数据函数
import './date.dart';

class DateGrid extends StatefulWidget {
  const DateGrid({Key? key}) : super(key: key);
  @override
  State<DateGrid> createState() => _DateGridState();
}

class _DateGridState extends State<DateGrid> {
  String dateStr = dateFn(DateTime.now())['dateStr']; // 默认当天

  void onClick(String value) {
    setState(() {
      dateStr = value;
      print(dateStr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Week(),
                Item(onClick: onClick, dateStr: dateStr),
                LineSpace(10.0),
                RecordList(),
              ],
            ))
      ],
    );
  }
}
