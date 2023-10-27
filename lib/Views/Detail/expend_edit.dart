import 'package:flutter/material.dart';
// 路由配置
import 'package:note_app/router/application.dart';
// EventBus
import 'package:note_app/event/bus.dart';

// 自定义组件
import 'package:note_app/Views/Create/amount_input.dart';
import 'package:note_app/Views/Create/group_tag.dart';
import 'package:note_app/Views/Create/remark.dart';
import 'package:note_app/Views/Create/button.dart';
import 'package:note_app/Views/Create/date_picker_popup.dart';
import 'package:note_app/Views/Component/loading.dart';
import 'package:note_app/Views/Component/failed.dart';
import 'package:note_app/Views/Component/title_cell.dart';
import 'package:note_app/Views/Component/button.dart';

// service
import 'package:note_app/service/record_service.dart';
import 'package:note_app/model/record_model.dart';

// 工具类
import 'package:note_app/tools/show_snack.dart';

class ExpendEdit extends StatefulWidget {
  ExpendEdit({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<ExpendEdit> createState() => _ExpendEditState();
}

class _ExpendEditState extends State<ExpendEdit> {
  bool liading = true;
  bool success = true;
  Map<String, dynamic> detail = {};

  List<int> recordDateUnix= [];

  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() => liading = true);
    final data = await RecordService.getDetail(widget.id);
    if (data.code == 200) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(data.data.recordDateUnix);
      // 设置金额
      amountKey.setValue(data.data.amount.toString());
      setState(() {
        detail = data.data;
        recordDateUnix = [date.year, date.month, date.day];
        liading = false;
        success = true;
      });
    } else {
      setState(() {
        detail = {};
        success = false;
        liading = false;
      });
    }
    return data;
  }

  GlobalKey dateKey = GlobalKey();
  GlobalKey amountKey = GlobalKey();
  GlobalKey tagKey = GlobalKey();
  GlobalKey remarkKey = GlobalKey();

  // 保存
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

    RecordService.edit(data).then((data) => {
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

  // 删除
  void del(BuildContext context) {
    RecordService.del(widget.id).then((data) => {
      if (data.code == 200)
        {
          Bus.eventBus.fire(const UpdateTotalEvent('record')),
          Application.router.pop(context),
          showSnackBar(context, '删除成功')
        }
      else
        {showSnackBar(context, data.msg)}
    });
  }

  // 底部按钮
  Widget GropsBtns(BuildContext context) {
    return Container(
      height: 44.0,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(children: <Widget>[
        Expanded(
            child: NoteButton(
                text: '删除',
                onClick: () {
                  del(context);
                })),
        Expanded(
          child: NoteButton(
              text: '保存',
              onClick: () {
                submit(context);
              }),
        ),
      ])
    );
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 10.0;
    const appBar = AppBar(
      title: Text("编辑支出"),
      elevation: 0,
    );
    if (liading) {
      return Scaffold(
        appBar: appBar,
        body: Loading()
      );
    } else if (!liading && !success) {
       return Scaffold(
        appBar: appBar,
        body: Failed(onClick: () {
          getData();
        })
      );
    } else {
      return Scaffold(
        appBar: appBar,
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DatePickerPopup(key: dateKey, value: recordDateUnix), // 日期
                    AmountInput(key: amountKey), // 金额
                    SizedBox(height: spacing),
                    TitleCell(title: "消费类型"),
                    SizedBox(height: spacing),
                    GroupTag(key: tagKey), // 分类
                    SizedBox(height: spacing),
                    TitleCell(title: "备注"),
                    SizedBox(height: spacing),
                    RemarkInput(key: remarkKey), // 备注
                    SizedBox(height: spacing)
                  ]),
            )
          ],
        ),
        bottomNavigationBar: GropsBtns(context)
      );
    }
  }
}
