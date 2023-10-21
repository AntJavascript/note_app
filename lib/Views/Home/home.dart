import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 自定义组件
import 'package:note_app/Views/Home/Widgets/line_space.dart';
import 'package:note_app/Views/Home/Widgets/record_list.dart';
import 'package:note_app/Views/Home/Widgets/budget_card.dart';
import 'package:note_app/Views/Home/Widgets/current_day_total.dart';

// 日期数据函数
import 'package:note_app/tools/date.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dateStr = dateFn(DateTime.now())['dateStr']; // 默认当天

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:() async {
        //模拟网络请求
        await Future.delayed(Duration(milliseconds: 2000));
        //结束刷新
        return Future.value(true);
      },
      child:ListView(
        children: [
          Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BudgetCard(),
                  LineSpace(),
                  CurrentDayTotal(),
                  LineSpace(),
                  RecordList(),
                ],
              ))
        ],
      )
    );
  }
}
