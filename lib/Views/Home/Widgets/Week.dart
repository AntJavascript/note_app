import 'package:flutter/material.dart';

class DateHead extends StatelessWidget {
  final List<String> _list = ['一', '二', '三', '四', '五', '六', '日'];

  DateHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _list.map((s) {
          return Container(
              width: MediaQuery.of(context).size.width / 7,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                s,
                style: const TextStyle(fontSize: 16),
              ));
        }).toList());
  }
}
