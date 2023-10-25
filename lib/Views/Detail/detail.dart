import 'package:flutter/material.dart';
// 路由配置
import 'package:note_app/router/application.dart';

// 自定义组件
import 'package:note_app/Views/Create/expend/expend_page.dart';
import 'package:note_app/Views/Create/income/income_page.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.id, required this.type = ''}) : super(key: key);

  final int id;
  final String type;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == "expend" ? ExpendEdit(widget.id) : IncomeEdit(widget.id);
  }
}
