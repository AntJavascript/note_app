import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// 公共组件
import 'package:note_app/Views/Component/title_cell.dart';

// 自定义组件
import 'package:note_app/Views/Create/amount_input.dart';
import 'package:note_app/Views/Create/group_tag.dart';
import 'package:note_app/Views/Create/remark.dart';
import 'package:note_app/Views/Create/button.dart';
import 'package:note_app/Views/Create/date_picker_popup.dart';

class Create extends StatelessWidget {
  Create({super.key});

  GlobalKey dateKey = GlobalKey();
  GlobalKey amountKey = GlobalKey();
  GlobalKey tagKey = GlobalKey();
  GlobalKey remarkKey = GlobalKey();

  void submit() {
    print(dateKey.currentState.getvalue());
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('记一笔'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DatePickerPopup(key: dateKey),
              AmountInput(key: amountKey),
              SizedBox(height: spacing),
              TitleCell(title: "消费类型"),
              SizedBox(height: spacing),
              GroupTag(key: tagKey),
              SizedBox(height: spacing),
              TitleCell(title: "备注"),
              SizedBox(height: spacing),
              RemarkInput(key: remarkKey),
              SizedBox(height: spacing),
              CreateButton(submit: submit, text: "确定")
            ]),
          )
        ],
      ),
    );
  }
}
