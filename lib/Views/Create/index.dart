import 'package:flutter/material.dart';
// 路由配置
import 'package:note_app/router/application.dart';

// 自定义组件
import 'package:note_app/Views/Create/expend/expend_page.dart';
import 'package:note_app/Views/Create/income/income_page.dart';
import 'package:note_app/Views/Create/transfer/transfer_page.dart';

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
    List tabs = ["支出", "收入", "转账"];
    return Scaffold(
      appBar: AppBar(
          title: Text("记一笔"),
          bottom: TabBar(
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
      body: TabBarView( //构建
          children: tabs.map((e) {
            return Container(
                alignment: Alignment.center,
                child: Text(e, textScaleFactor: 5),
            );
          }).toList(),
        ),
    );
  }
}
