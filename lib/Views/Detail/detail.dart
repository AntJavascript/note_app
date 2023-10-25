import 'package:flutter/material.dart';
// 路由配置
import 'package:note_app/router/application.dart';

// 自定义组件
import 'package:note_app/Views/Detail/expend_edit.dart';
import 'package:note_app/Views/Detail/income_edit.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.id, required this.type})
      : super(key: key);

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
    return widget.type == "expend"
        ? ExpendEdit(id: widget.id)
        : IncomeEdit(id: widget.id);
  }
}
