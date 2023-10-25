import 'package:flutter/material.dart';
// 路由配置
import 'package:note_app/router/application.dart';

// 自定义组件
import 'package:note_app/Views/Detail/expend_edit.dart';
import 'package:note_app/Views/Detail/income_edit.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.id = '', required this.type = ''}) : super(key: key);

  final dynamic id;
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
      body: widget.type == "expend" ? ExpendEdit() : IncomeEdit(),
    );
  }
}
