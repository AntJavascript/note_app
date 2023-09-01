import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';
// 全局字体配置
import 'package:note_app/config/appIcon.dart';

// 自定义组件
import 'package:note_app/Views/Component/title_cell.dart';

class CurrentDayTotal extends StatefulWidget {
  const CurrentDayTotal({Key? key, required this.dateStr}) : super(key: key);
  
  final String? dateStr;
  
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
    return Column(
        children: [
          TitleCell("${widget.dateStr} 收支统计"),
          Row(children:[
            Expanded(child: Income("今日支出", "0.00")),
            Expanded(child: Income("今日收入", "0.00"))
          ]),
        ]
    );
  }

  Widget Income(String text, {String type = 'income'}) {
    bool isIncome = type == 'income';
    return TailTypo()
        .font_size(16.0)
        .text_color(isIncome
            ? AppColorConfig.incomeTextColor
            : AppColorConfig.expendTextColor)
        .Text("${isIncome ? "-" : "+"}${text}");
  }
}
