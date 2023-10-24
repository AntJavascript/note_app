import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';

class CreateButton extends StatelessWidget {
  final Function? submit;
  final String text;

  const CreateButton({super.key, this.submit, this.text = '确定'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        submit!();
      },
      child: Container(
        height: 40,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: TailTypo().text_color(Colors.white).Text("确定"),
        decoration: BoxDecoration(
            color: AppColorConfig.buttonBgColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
