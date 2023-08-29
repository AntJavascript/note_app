import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'note_app/config/them.dart';

class BudgetCard extends StatefulWidget {
  const BudgetCard({Key? key}) : super(key: key);
  @override
  State<BudgetCard> createState() => _BudgetCardState();
}

class _BudgetCardState extends State<BudgetCard> {
  @override
  Widget build(BuildContext context) {
    return TailBox().px(16).rounded(30).bg(AppThem.iconBgColor).Container();
  }
}

