import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// EventBus
import 'package:note_app/event/bus.dart';

// 全局配置
import 'package:note_app/config/them.dart';

// 自定义组件
import 'package:note_app/Views/Component/title_cell.dart';
import 'package:note_app/Views/Home/Widgets/line_space.dart';

// service
import 'package:note_app/service/total_service.dart';

// model
import 'package:note_app/model/total_model.dart';

class CurrentDayTotal extends StatefulWidget {
  const CurrentDayTotal({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CurrentDayTotalState();
}

class _CurrentDayTotalState extends State<CurrentDayTotal> {
  String income = "0.0";
  String expend = "0.0";

  getData() {
    TotalService.getTotalDay().then((data) => {
          print("当日统计数据"),
          setState(() {
            income = data.incomeCount.toString();
            expend = data.expendCount.toString();
          })
        });
  }

  @override
  initState() {
    super.initState();
    // 获取列表数据
    getData();
    Bus.eventBus.on<UpdateTotalEvent>().listen((event) {
      print('======================================================');
      print(event.type);
      getData();
    });
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
            Income("今日支出", type: "expend"),
            LineSpace(
              color: Colors.white,
            ),
            Amount(expend, type: "expend"),
            LineSpace(
              height: 20,
              color: Colors.white,
            ),
          ],
        )),
        Expanded(
            child: Column(
          children: [
            Income("今日收入", type: "income"),
            LineSpace(
              color: Colors.white,
            ),
            Amount(income, type: "income"),
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
            ? AppColorConfig.expendTextColor
            : AppColorConfig.incomeTextColor)
        .Text(text);
  }

  Widget Amount(String text, {String type = 'income'}) {
    bool isIncome = type == 'income';
    return TailTypo()
        .font_size(24.0)
        .text_color(isIncome
            ? AppColorConfig.expendTextColor
            : AppColorConfig.incomeTextColor)
        .Text(isIncome ? "+${text}" : "-${text}");
  }
}
