import 'package:flutter/material.dart';

// tag 组件
import 'tag.dart';

class GroupTag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroupTagState();
}

class GroupTagState extends State<GroupTag>{

 const List<String> tags = ['吃饭', '网购', '超市', '交通', '房租', '电话', '医药', '人情', '其他'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Wrap(children:tags..map((e) {
        return Tag(e);
      }).tolist())
    )
  }
}
