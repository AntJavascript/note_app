import 'package:flutter/material.dart';
// 路由配置
import 'package:note_app/router/application.dart';

// 自定义组件
import 'package:note_app/Views/Create/expend/expend_page.dart';
import 'package:note_app/Views/Create/income/income_page.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.id, required this.type = ''}) : super(key: key);

  final int id;
  final String type;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  initState() {
    super.initState();
    // 获取列表数据
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("编辑"),
      ),
      body: widget.type == "expend" ? ExpendEdit(widget.id) : IncomeEdit(widget.id),
    );
  }
}
