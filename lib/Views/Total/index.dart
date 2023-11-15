import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 自定义组件
import 'package:note_app/Views/Total/year_tab.dart';
import 'package:note_app/Views/Total/month_tab.dart';
import 'package:note_app/Views/Total/day_tab.dart';
import 'package:note_app/Views/Total/total_tab.dart';

class TotalPage extends StatefulWidget {
  const TotalPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TotalPageState();

  void change() {}
}

class _TotalPageState extends State<TotalPage> {
  @override
  initState() {
    super.initState();
  }

  void itemClick(Colors color) {}

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> tabs = [
      {
        "text": "按日",
        "type": "day",
      },
      {
        "text": "按月",
        "type": "month",
      },
      {
        "text": "按年",
        "type": "year",
      },
      {
        "text": "总计",
        "type": "total",
      }
    ];
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: tabs.map((e) => Tab(text: e["text"])).toList(),
            ),
            elevation: 0,
          ),
          body: TabBarView(
            children: tabs.map((e) {
              if (e["type"] == "day") {
                return TotalDayTab();
              } else if (e["type"] == "month") {
                return TotalMonthTab();
              } else if (e["type"] == "year") {
                return TotalYaerTab();
              }
              return TotalTab();
            }).toList(),
          ),
        ));
  }
}
