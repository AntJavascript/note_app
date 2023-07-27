class AmountInput extends StatefulWidget {
    @override
  State<StatefulWidget> createState() => AmountInputState();
}

class AmountInputState extends State<AmountInput>{

  @override
  void initState() {
    super.initState();
    _amountController.text = '0.0';
  }

  //文本编辑控制器
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child:TextField(
        controller: _amountController,
        keyboardType: TextInputType.phone,
        autofocus: true,
        style: TailTypo().font_size(32.0).TextStyle()
    ))
  }

}
