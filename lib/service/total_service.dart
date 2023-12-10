import 'package:note_app/http.dart';
import 'package:note_app/model/total_model.dart';
import 'package:note_app/model/total_month_detail.dart';

class TotalService {
  // 查询日期数据统计
  static getTotalDay() async {
    // 开启日志打印
    DioUtil.instance?.openLog();

    var response = await DioUtil().request('/total/day');
    total_model result = total_model.fromJson(response);
    return result;
  }

  // 查询月份数据统计
  static getTotalMonth(int year, int month) async {
    // 开启日志打印
    DioUtil.instance?.openLog();

    var response =
        await DioUtil().request("/total/month?year=${year}&month=${month}");
    total_model result = total_model.fromJson(response);
    return result;
  }

  // 查询年份数据统计
  static getTotalYear(data) async {
    // 开启日志打印
    DioUtil.instance?.openLog();

    var response = await DioUtil().request('/total/year');
    total_model result = total_model.fromJson(response);
    return result;
  }

  // 查询月份数据统计明细
  static totalMonthDetail(int year, int month) async {
    // 开启日志打印
    DioUtil.instance?.openLog();

    var response = await DioUtil()
        .request("/total/totalMonthDetail?year=${year}&month=${month}");
    total_month_detail result = total_month_detail.fromJson(response);
    return result;
  }
}
