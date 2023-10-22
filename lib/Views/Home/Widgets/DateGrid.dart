import 'package:flutter/material.dart';

// 自定义组件
import 'package:note_app/Views/Home/Widgets/line_space.dart';
import 'package:note_app/Views/Home/Widgets/record_list.dart';
import 'package:note_app/Views/Home/Widgets/budget_card.dart';
import 'package:note_app/Views/Home/Widgets/current_day_total.dart';

// 日期数据函数
import 'package:note_app/tools/date.dart';

class DateGrid extends StatefulWidget {
  const DateGrid({Key? key}) : super(key: key);
  @override
  State<DateGrid> createState() => _DateGridState();
}

class _DateGridState extends State<DateGrid> {
  String dateStr = dateFn(DateTime.now())['dateStr']; // 默认当天

  GlobalKey budgetKey = GlobalKey();
  GlobalKey dayTotalKey = GlobalKey();
  GlobalKey recordKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          //模拟网络请求
          await Future.delayed(Duration(milliseconds: 2000));
          //结束刷新
          return Future.value(true);
          
          var budget = budgetKey.currentState as _BudgetCardState;
          budget.getDate();

          var dayTotal = dayTotalKey.currentState as _RecordListState;
          dayTotal.getDate();

        },
        child: ListView(
          children: [
            Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BudgetCard(key: budgetKey),
                    LineSpace(),
                    CurrentDayTotal(key: dayTotalKey),
                    LineSpace(),
                    RecordList(key: recordKey),
                  ],
                ))
          ],
        ));
  }
}
