import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'note_app/config/them.dart';

class BudgetCard extends StatefulWidget {
  const BudgetCard({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BudgetCardState();
}

class _BudgetCardState extends State<BudgetCard> {
  @override
  Widget build(BuildContext context) {
    return TailBox().px(16).rounded(30).bg(AppThem.ThemColor).Container(
      child:Column(
        children:[
          Title("本月支出"),
          Amount("1595.65"),
          Income("本月收入", "0.00")
        ],
      )
    );
  }
}
Widget Title(String text) {
  return TailTypo().font_size(12.0).text_color(Colors.gray).Text(text);
}

Widget Amount(String text) {
  return TailTypo().font_size(24.0).text_color(Colors.black).Text(text);
}

Widget Income(String text, String amount) {
  return TailTypo().font_size(24.0).text_color(Colors.black).Text("${text} ${amount}");
}
