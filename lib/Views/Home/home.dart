import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

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
    String title = "${dateStr["year"]}年${dateStr["month"]}月";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Application.router.navigateTo(context, "/create"); // 跳转创建界面
        },
        child: TailTypo().font_size(12).Text("记一笔"),
      ),
      body: const DateGrid(),
    );
  }
}
