import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';

// 自定义组件
import 'package:note_app/Views/Component/title_cell.dart';
import 'package:note_app/Views/Home/Widgets/line_space.dart';

class CurrentDayTotal extends StatefulWidget {
  const CurrentDayTotal({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CurrentDayTotalState();
}

class _CurrentDayTotalState extends State<CurrentDayTotal> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TitleCell(title: "收支统计"),
      LineSpace(
        height: 20,
        color: Colors.white,
      ),
      Row(children: [
        Expanded(
            child: Column(
          children: [
            Income("今日支出", type: "income"),
            LineSpace(
              color: Colors.white,
            ),
            Amount("123.89", type: "income"),
            LineSpace(
              height: 20,
              color: Colors.white,
            ),
          ],
        )),
        Expanded(
            child: Column(
          children: [
            Income("今日收入", type: "expend"),
            LineSpace(
              color: Colors.white,
            ),
            Amount("0", type: "expend"),
            LineSpace(
              height: 20,
              color: Colors.white,
            ),
          ],
        ))
      ]),
    ]);
  }

  Widget Income(String text, {String type = 'income'}) {
    bool isIncome = type == 'income';
    return TailTypo()
        .font_size(16.0)
        .text_color(isIncome
            ? AppColorConfig.incomeTextColor
            : AppColorConfig.expendTextColor)
        .Text(text);
  }

  Widget Amount(String text, {String type = 'income'}) {
    bool isIncome = type == 'income';
    return TailTypo()
        .font_size(24.0)
        .text_color(isIncome
            ? AppColorConfig.incomeTextColor
            : AppColorConfig.expendTextColor)
        .Text(isIncome ? "-${text}" : "+${text}");
  }
}
