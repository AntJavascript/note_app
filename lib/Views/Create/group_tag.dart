import 'package:flutter/material.dart';

// 全局配置
import 'package:note_app/config/them.dart';

// 全局字体配置
import 'package:note_app/config/appIcon.dart';

// tag 组件
import 'tag.dart';

class GroupTag extends StatefulWidget {
  const GroupTag({super.key});

  @override
  State<StatefulWidget> createState() => GroupTagState();
}

class GroupTagState extends State<GroupTag> {
  List<Map<String, String>> tags = [
    {
      "icon": "restaurant",
      "text": '餐饮',
    },
    {
      "icon": "ecommerce",
      "text": '网购',
    },
    {
      "icon": "necessities",
      "text": '超市',
    },
    {
      "icon": "smoke",
      "text": '烟酒',
    },
    {
      "icon": "housing",
      "text": '住房',
    },
    {
      "icon": "communicate",
      "text": '通讯',
    },
    {
      "icon": "car",
      "text": '交通',
    },
    {
      "icon": "medical",
      "text": '医疗',
    },
    {
      "icon": "holiday",
      "text": '娱乐',
    },
    {
      "icon": "redEnvelope",
      "text": '人情',
    },
    {
      "icon": "education",
      "text": '教育',
    },
    {
      "icon": "other",
      "text": '其他',
    }
  ];

  String current = "";

  @override
  void initState() {
    super.initState();
  }

  get getValue => current;

  void onClick(String value) {
    setState(() {
      current = value;
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        runSpacing: 16,
        children: tags.map((e) {
          return Container(
            width: 80,
            child: Tag(
              text: e["text"],
              icon: e["icon"],
              onClick: onClick,
              isActive: current == e["icon"],
            ),
          );
        }).toList());
  }
}
