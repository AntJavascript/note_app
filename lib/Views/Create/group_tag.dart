import 'package:flutter/material.dart';

// tag 组件
import 'tag.dart';

class GroupTag extends StatefulWidget {
  const GroupTag({super.key});

  @override
  State<StatefulWidget> createState() => GroupTagState();
}

class GroupTagState extends State<GroupTag> {
  List<String> tags = ['吃饭', '网购', '超市', '房租', '通讯', '交通', '娱乐', '人情', '教育', '转账', '支付宝', '微信', '信用卡', '其他'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        runSpacing: 16,
        children: tags.map((e) {
          return Tag(e);
        }).toList());
  }
}
