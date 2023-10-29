import 'package:flutter/material.dart';
// 路由配置
import 'package:note_app/router/application.dart';
// EventBus
import 'package:note_app/event/bus.dart';

// 公共组件
import 'package:note_app/Views/Component/title_cell.dart';

// 自定义组件
import 'package:note_app/Views/Create/amount_input.dart';
import 'package:note_app/Views/Create/group_tag.dart';
import 'package:note_app/Views/Create/remark.dart';
import 'package:note_app/Views/Create/button.dart';
import 'package:note_app/Views/Create/date_picker_popup.dart';

// service
import 'package:note_app/service/record_service.dart';

// 工具类
import 'package:note_app/tools/show_snack.dart';

class Incomepage extends StatefulWidget {
  Incomepage({super.key});
  @override
  State<Incomepage> createState() => _IncomepageState();
}

class _IncomepageState extends State<Incomepage> {
  @override
  initState() {
    super.initState();
  }

  GlobalKey dateKey = GlobalKey();
  GlobalKey amountKey = GlobalKey();
  GlobalKey tagKey = GlobalKey();
  GlobalKey remarkKey = GlobalKey();

  void submit(BuildContext context) {
    Map<String, dynamic> data = {};

    var datePickerWidget = dateKey.currentState as DatePickerPopupState; // 日期
    var amountWidget = amountKey.currentState as AmountInputState; // 金额
    var tagWidget = tagKey.currentState as GroupTagState; // 消费类型
    var remark = remarkKey.currentState as RemarkInputState; // 备注

    data["record_date"] = datePickerWidget.values;
    data["amount"] = double.parse(amountWidget.amount);
    data["type"] = "expend";
    data["record_type"] = tagWidget.current;
    data["record_type_name"] = tagWidget.currentText;
    data["remark"] = remark.controller.text;
    data["account"] = "15817351609";

    RecordService.add(data).then((data) => {
          if (data.code == 200)
            {
              Bus.eventBus.fire(const UpdateTotalEvent('record')),
              Application.router.pop(context),
              showSnackBar(context, '成功')
            }
          else
            {showSnackBar(context, data.msg)}
        });
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 10.0;
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            DatePickerPopup(key: dateKey), // 日期
            AmountInput(
              key: amountKey,
            ), // 金额
            SizedBox(height: spacing),
            TitleCell(title: "消费类型"),
            SizedBox(height: spacing),
            GroupTag(key: tagKey), // 分类
            SizedBox(height: spacing),
            TitleCell(title: "备注"),
            SizedBox(height: spacing),
            RemarkInput(key: remarkKey), // 备注
            SizedBox(height: spacing),
            CreateButton(
                submit: () {
                  submit(context);
                },
                text: "确定")
          ]),
        )
      ],
    );
  }
}
