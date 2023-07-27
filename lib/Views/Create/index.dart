import 'package:flutter/material.dart';

// 输入组件
import 'amount_input.dart';
import 'date_picker_popup.dart';

class Create extends StatelessWidget {
  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('记一笔'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Colum(children:[AmountInput(), DatePickerPopup()]),
    );
  }
}
