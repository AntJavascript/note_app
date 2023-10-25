import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// EventBus
import 'package:note_app/event/bus.dart';

// 全局配置
import 'package:note_app/config/them.dart';

// service
import 'package:note_app/service/total_service.dart';

// 日期数据函数
import 'package:note_app/tools/date.dart';

class BudgetCard extends StatefulWidget {
  const BudgetCard({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => BudgetCardState();
}

class BudgetCardState extends State<BudgetCard> {
  String income = "0.0";
  String expend = "0.0";

  getDate(int year, int month) {
    TotalService.getTotalMonth(year, month).then((data) => {
          setState(() {
            income = data.incomeCount.toString();
            expend = data.expendCount.toString();
          })
        });
  }

  @override
  initState() {
    super.initState();

    Map<String, dynamic> dateStr = dateFn(DateTime.now()); // 日期
    // 获取数据
    getDate(dateStr["year"], dateStr["month"]);

    // 事件监听
    Bus.eventBus.on<UpdateTotalEvent>().listen((event) {
      getDate(dateStr["year"], dateStr["month"]);
    });
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TailBox().p(10).bg(AppColorConfig.themColor).Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Title("本月支出"),
            Amount(expend),
            Row(
              children: [
                Expanded(child: Income("本月收入", income)),
                Expanded(child: Income("本月预算", "0.00"))
              ],
            )
          ],
        ));
  }
}

Widget Title(String text) {
  return TailTypo().font_size(14.0).text_color(Colors.black).Text(text);
}

Widget Amount(String text) {
  return TailBox().py(20).Container(
          child: Row(
        children: [
          TailTypo().font_size(18.0).text_color(Colors.black).Text("￥"),
          TailTypo().font_size(44.0).text_color(Colors.black).Text(text)
        ],
      ));
}

Widget Income(String text, String amount) {
  return TailTypo()
      .font_size(16.0)
      .text_color(Colors.black)
      .Text("${text} ${amount}");
}
