import 'package:flutter/material.dart';
import "package:flutter_vantui/flutter_vantui.dart";
import 'package:note_app/Views/Home/Widgets/common/with_value.dart';

class DatePickerPopup extends StatefulWidget {
  final Function? onClick;

  const DatePickerPopup({Key? key, this.onClick}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DatePickerPopupState();
}

class DatePickerPopupState extends State<DatePickerPopup> {
  final _show = ValueNotifier(false);
  String values =
      '${DateTime.now().year}, ${DateTime.now().month}, ${DateTime.now().day}';

  @override
  void initState() {
    super.initState();
  }

  // 确认回调
  confirm(val) {
    _show.value = false;
    setState(() => values = val);
  }

  // 取消回调
  cancel(val) {
    _show.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      VanCell(
        title: values,
        clickable: true,
        onTap: () => _show.value = true,
      ),
      VanPopup(
        show: _show.value,
        position: VanPopupPosition.bottom,
        round: true,
        child: _show.value
            ? WithModel(
                [DateTime.now().year, DateTime.now().month, DateTime.now().day],
                (model) {
                return VanDatePicker(
                  value: model.value,
                  onChange: (value) => model.value = value,
                  onConfirm: (val) => confirm(val),
                  onCancel: (val) => cancel(val),
                );
              })
            : nil,
      )
    ]);
  }
}
