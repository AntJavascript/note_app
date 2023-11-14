import 'package:flutter/material.dart';
// 路由配置
import 'package:note_app/router/application.dart';
// EventBus
import 'package:note_app/event/bus.dart';

// 自定义组件
import 'package:note_app/Views/Create/amount_input.dart';
import 'package:note_app/Views/Create/group_tag.dart';
import 'package:note_app/Views/Create/remark.dart';
import 'package:note_app/Views/Create/date_picker_popup.dart';
import 'package:note_app/Views/Component/loading.dart';
import 'package:note_app/Views/Component/failed.dart';
import 'package:note_app/Views/Component/title_cell.dart';
import 'package:note_app/Views/Component/button.dart';

// service
import 'package:note_app/service/record_service.dart';
import 'package:note_app/model/redod_detail.dart';

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
  late redod_detail detail;

  GlobalKey<DatePickerPopupState> datePickerState =
      GlobalKey<DatePickerPopupState>();
  GlobalKey<AmountInputState> amountInputState = GlobalKey<AmountInputState>();
  GlobalKey tagKey = GlobalKey();
  GlobalKey remarkKey = GlobalKey();

  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() => liading = true);
    final data = await RecordService.getDetail(widget.id);
    if (data.code == 200) {
      // 设置默认值
      WidgetsBinding.instance.addPostFrameCallback((_) {
        amountInputState.currentState?.setValue(data.data.amount.toString());
        datePickerState.currentState?.setValue(data.data.record_date);
      });

      setState(() {
        detail = data;
        liading = false;
        success = true;
      });
    } else {
      setState(() {
        detail = {} as redod_detail;
        success = false;
        liading = false;
      });
    }
    return data;
  }

  // 保存
  void submit(BuildContext context) {
    Map<String, dynamic> data = {};

    var tagWidget = tagKey.currentState as GroupTagState; // 消费类型
    var remark = remarkKey.currentState as RemarkInputState; // 备注
    data["record_date"] = datePickerState.currentState?.values ?? '';
    data["amount"] = double.parse(amountInputState.currentState?.amount ?? '');
    data["type"] = "expend";
    data["record_type"] = tagWidget.current;
    data["record_type_name"] = tagWidget.currentText;
    data["remark"] = remark.controller.text;
    data["account"] = "15817351609";
    data["id"] = widget.id;

    RecordService.edit(data).then((data) => {
          if (data.code == 200)
            {
              Bus.eventBus.fire(const UpdateTotalEvent('record')),
              Application.router.pop(context)
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
              Application.router.pop(context)
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
        ]));
  }

  AppBar AppBarTitle() {
    return AppBar(
      title: Text("编辑"),
    );
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 10.0;

    if (liading) {
      return Scaffold(appBar: AppBarTitle(), body: Loading());
    } else if (!liading && !success) {
      return Scaffold(
          appBar: AppBarTitle(),
          body: Failed(onClick: () {
            getData();
          }));
    } else {
      return Scaffold(
          appBar: AppBarTitle(),
          body: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DatePickerPopup(key: datePickerState), // 日期
                      AmountInput(
                        key: amountInputState,
                      ), // 金额
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
          bottomNavigationBar: GropsBtns(context));
    }
  }
}
