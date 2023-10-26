// 处理日期函数
Map<String, dynamic> dateFn(DateTime date) {
  final int year = date.year; // 年
  final int month = date.month; // 月
  final int day = date.day; // 日
  final int dayCount = DateTime(year, month + 1, 0).day; // 当月最大天数
  final int firstWeekDay = DateTime(year, month, 1).weekday; // 当月第一天是周几
  final int lastWeekDay = DateTime(year, month, dayCount).weekday; // 当月最后一天是周几
  final int beforeSpace = firstWeekDay - 1; // 当月第一天前面空格数量
  final int afterSpace = 7 - lastWeekDay; // 当月最后一天后面空格数量
  final String dateStr = '$year-$month-$day'; // 年-月-日

  Map<String, dynamic> data = {};

  data['obj'] = date;
  data['year'] = year;
  data['month'] = month;
  data['day'] = day;
  data['dayCount'] = dayCount;
  data['beforeSpace'] = beforeSpace;
  data['afterSpace'] = afterSpace;
  data['dateStr'] = dateStr;

  return data;
}

// 生成渲染数据
List<Map<String, dynamic>> renderData(DateTime date) {
  Map<String, dynamic> dateObj = dateFn(date);

  List<Map<String, dynamic>> list = []; // 当月日期数据

  list.addAll(renderEmpty(dateObj['beforeSpace']));
  list.addAll(renderValidData(dateObj['dayCount'], dateObj));
  list.addAll(renderEmpty(dateObj['afterSpace']));

  return list;
}

// 生成空数据
List<Map<String, dynamic>> renderEmpty(int mun) {
  List<Map<String, dynamic>> list = [];
  for (var i = 0; i < mun; i++) {
    list.add({'str': ''});
  }
  return list;
}

// 生成日期有效数据
List<Map<String, dynamic>> renderValidData(int mun, Map<String, dynamic> date) {
  List<Map<String, dynamic>> list = [];
  for (var i = 1; i <= mun; i++) {
    list.add({'str': '${date['year']}-${date['month']}-$i', 'day': i});
  }
  return list;
}
