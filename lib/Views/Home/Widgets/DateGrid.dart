import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';

// 自定义组件
import 'package:note_app/Views/Home/Widgets/week.dart';
import 'package:note_app/Views/Home/Widgets/item.dart';
import 'package:note_app/Views/Home/Widgets/line_space.dart';
import 'package:note_app/Views/Home/Widgets/record_list.dart';
import 'package:note_app/Views/Home/Widgets/budget_card.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                currentDateWidget(),
                BudgetCard(),
                LineSpace(
                  height: 20,
                  color: Colors.white,
                ),
                Week(),
                Item(onClick: onClick, dateStr: dateStr),
                LineSpace(height: 10),
                RecordList(),
              ],
            ))
      ],
    );
  }
}

Widget currentDateWidget(String dateStr) {
  return Row(children: [
      TailBox().bg(AppColorConfig.themColor).Container(
        width: 2,
        height: 20,
        margin: EdgeInsets.only(right: 8.0),
      ),
      TailTypo().text_color(Colors.black).Text(title)
    ])
}
