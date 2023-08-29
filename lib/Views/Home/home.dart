import 'package:flutter/material.dart';

// UI内容组件
import 'package:note_app/Views/Home/Widgets/DateGrid.dart';

// 路由配置
import 'package:note_app/router/application.dart';
// 日期处理函数
import 'package:note_app/Views/Home/Widgets/date.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> dateStr = dateFn(DateTime.now()); // 日期数据

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("${dateStr["year"]}年${dateStr["month"]}月"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Application.router.navigateTo(context, "/create");
        },
        child: Text(
          '记一笔',
          style: TextStyle(fontSize: 12.0),
        ),
      ),
      body: const DateGrid(),
    );
  }
}
