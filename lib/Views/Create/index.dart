import 'package:flutter/material.dart';
// 路由配置
import 'package:note_app/router/application.dart';

// 自定义组件
import 'package:note_app/Views/Create/expend/expend_page.dart';
import 'package:note_app/Views/Create/income/income_page.dart';

class Create extends StatefulWidget {
  Create({super.key});
  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  initState() {
    super.initState();
    // 获取列表数据
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tabs = [
      {
        "text": "支出",
        "type": "expend",
      },
      {
        "text": "收入",
        "type": "income",
      }
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
            title: Text("记一笔"),
            bottom: TabBar(
              tabs: tabs.map((e) => Tab(text: e.text)).toList(),
            ),
          ),
        body: TabBarView(
            children: tabs.map((e) {
              if (e.["type"] == "expend") {
                return Expendpage();
              }
              return Incomepage();
            }).toList(),
          ),
      )
    );
  }
}
