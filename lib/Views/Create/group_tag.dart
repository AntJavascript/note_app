import 'package:flutter/material.dart';

// tag 组件
import 'tag.dart';

class GroupTag extends StatefulWidget {
  const GroupTag({super.key});

  @override
  State<StatefulWidget> createState() => GroupTagState();
}

class GroupTagState extends State<GroupTag> {
  List<String> tags = ['日常餐饮', '网购', '日用品', '烟酒', '住房', '水电煤气', '通讯', '交通', '医疗', '数码产品', '娱乐', '人情', '教育', '转账', '支付宝', '微信', '信用卡', '其他'];

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
