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
  GlobalKey budgetKey = GlobalKey();
  GlobalKey dayTotalKey = GlobalKey();
  GlobalKey recordKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    String title = dateFn(DateTime.now())['dateStr'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Map<String, dynamic> dateStr = dateFn(DateTime.now()); // 日期

          var budget = budgetKey.currentState as BudgetCardState;
          await budget.getData(dateStr["year"].toInt(), dateStr["month"]);

          var dayTotal = recordKey.currentState as RecordListState;
          await dayTotal.getData();

          var record = dayTotalKey.currentState as CurrentDayTotalState;
          await record.getData();

          //结束刷新
          return Future.value(true);
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
        ))
    );
  }
}
