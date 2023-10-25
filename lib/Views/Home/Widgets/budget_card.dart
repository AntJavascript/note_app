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

// 自定义组件
import 'package:note_app/Views/Component/loading.dart';
import 'package:note_app/Views/Component/failed.dart';

import 'package:provider/provider.dart';
// app主题颜色
import 'package:note_app/provider/skin_model.dart';

class BudgetCard extends StatefulWidget {
  const BudgetCard({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => BudgetCardState();
}

class BudgetCardState extends State<BudgetCard> {
  String income = "0";
  String expend = "0";
  String budget = "0";
  bool liading = true;
  bool success = true;

  // 获取数据
  getData(int year, int month) async {
    setState(() => liading = true);
    final data = await TotalService.getTotalMonth(year, month);
    if (data.code == 200) {
      setState(() {
        income = data.incomeCount.toString();
        expend = data.expendCount.toString();
        liading = false;
        success = true;
      });
    } else {
      setState(() {
        income = "0";
        expend = "0";
        success = false;
        liading = false;
      });
    }
    return data;
  }

  @override
  initState() {
    super.initState();

    Map<String, dynamic> dateStr = dateFn(DateTime.now()); // 日期
    // 获取数据
    getData(dateStr["year"], dateStr["month"]);

    // 事件监听
    Bus.eventBus.on<UpdateTotalEvent>().listen((event) {
      getData(dateStr["year"], dateStr["month"]);
    });
  }

  @override
  dispose() {
    super.dispose();
  }

  // 标题
  Widget Title(String text) {
    return TailTypo().font_size(14.0).text_color(Colors.black).Text(text);
  }

  // 金额显示
  Widget Amount(String text) {
    return TailBox().py(20).Container(
            child: Row(
          children: [
            TailTypo().font_size(18.0).text_color(Colors.black).Text("￥"),
            TailTypo().font_size(44.0).text_color(Colors.black).Text(text)
          ],
        ));
  }

  // 副标题
  Widget Income(String text, String amount) {
    return TailTypo()
        .font_size(16.0)
        .text_color(Colors.black)
        .Text("${text} ${amount}");
  }

  @override
  Widget build(BuildContext context) {
    if (liading) {
      return Loading();
    } else if (!liading && !success) {
      return Failed();
    } else {
      return TailBox().p(10).bg(Provider.of<AppSkin>(context).color).Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title("本月支出"),
              Amount(expend),
              Row(
                children: [
                  Expanded(child: Income("本月收入", income)),
                  Expanded(child: Income("本月预算", budget))
                ],
              )
            ],
          ));
    }
  }
}
