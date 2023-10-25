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
  State<StatefulWidget> createState() => CurrentDayTotalState();
}

class CurrentDayTotalState extends State<CurrentDayTotal> {
  String income = "0";
  String expend = "0";
  bool liading = true;
  bool success = true;

 // 获取数据
  getData() async {
    setState(() => liading = true);
    final data = await TotalService.getTotalDay();
    if(data.code == 200) {
      setState(() {
        income = data.incomeCount.toString();
        expend = data.expendCount.toString();
        liading = false;
        success = true;
      })
    } else {
      setState(() {
        income = "0";
        expend = "0";
        success = false;
        liading = false;
      })
    }
    return data;
  }

  @override
  initState() {
    super.initState();

    // 获取列表数据
    getData();

    // 事件监听
    Bus.eventBus.on<UpdateTotalEvent>().listen((event) {
      getData();
    });
  }

  // 数据显示
  Widget ShowData(String type, String title, String amount) {
    return Expanded(
      child: Column(
        children: [
          Income(title, type: type),
          LineSpace(
            color: Colors.white,
          ),
          Amount(amount, type: type),
          LineSpace(
            height: 20,
            color: Colors.white,
          ),
        ],
    ));
  }

  // 文字显示
  Widget Income(String text, {String type = 'income'}) {
    bool isIncome = type == 'income';
    return TailTypo()
        .font_size(16.0)
        .text_color(isIncome
            ? AppColorConfig.expendTextColor
            : AppColorConfig.incomeTextColor)
        .Text(text);
  }

  // 金额显示
  Widget Amount(String text, {String type = 'income'}) {
    bool isIncome = type == 'income';
    return TailTypo()
        .font_size(24.0)
        .text_color(isIncome
            ? AppColorConfig.expendTextColor
            : AppColorConfig.incomeTextColor)
        .Text(isIncome ? "+${text}" : "-${text}");
  }

  // 加载状态
  Widget Loading() {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: TailTypo().font_size(14.0).text_color(AppColorConfig.labelColor).Text('数据加载中...')
    );
  }

  // 加载失败显示
  Widget Failed () {
    return GestureDetector(
      onTap: () {
        getData();
      },
      child: Container(
        height: 100,
        alignment: Alignment.center,
        child: TailTypo().font_size(14.0).text_color(AppColorConfig.labelColor).Text('加载失败，点击重试')
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    if (liading) {
      return Loading();
    } else if (!liading && !success) {
      return Failed();
    } else {
      return Column(children: [
        TitleCell(title: "收支统计"),
        LineSpace(
          height: 20,
          color: Colors.white,
        ),
        Row(children: [
          ShowData("expend", "今日支出", expend),
          ShowData("income", "今日收入", income)
        ]),
      ]);
    }
  }
  
}
