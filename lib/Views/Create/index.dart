import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';
import "package:flutter_vantui/flutter_vantui.dart";

// 自定义组件
import 'amount_input.dart';
import 'date_picker_popup.dart';
import 'group_tag.dart';
import 'remark.dart';
import 'title_cell.dart';

class Create extends StatelessWidget {
  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    const spacing = 40.0;
    const line = 20.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('记一笔'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: Column(children: [
              AmountInput(),
              SizedBox(height: spacing),
              TitleCell('消费类型'),
              SizedBox(height: line),
              GroupTag(),
              SizedBox(height: spacing),
              TitleCell('备注'),
              SizedBox(height: line),
              RemarkInput(),
              SizedBox(height: spacing),
              VanBtn(
                text: "确定",
                type: VanBtnType.primary,
                round: true,
                size: VanBtnSize.large,
                block: true,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
