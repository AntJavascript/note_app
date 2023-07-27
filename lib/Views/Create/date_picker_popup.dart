class DatePickerPopup extends StatefulWidget {

  final Function? onClick;

  const DatePickerPopup({Key? key, this.onClick}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DatePickerPopupState();
}

class DatePickerPopupState extends State<DatePickerPopup>{

  final _show = ValueNotifier(false);
  final DateTime now = DateTime.now();
  String values = '${now.year}, ${now.month}, ${now.day}';

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
    return Stack(
      children:[
        Cell(
          title: values,
          clickable: true,
          onTap: () => _show.value = true,
        ),
        Popup(
          show: show,
          position: PopupPosition.bottom,
          round: true,
          child: _show
            ? WithModel(
              [now.year, now.month, now.day],
              (model) {
              return VanDatePicker(
                value: model.value,
                onChange: (value) => model.value = value,
                onConfirm: (val) => confirm(val),
                onCancel: (val) => cancel(val),
              );
            })
          : nil,
      )]
    ),
  }
}
