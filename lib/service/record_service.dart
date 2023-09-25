import 'package:note_app/http.dart';
import 'package:note_app/model/record_model.dart';

class RecordService {
  // 根据日期查询列表
  static getList() async {
    // 开启日志打印
    DioUtil.instance?.openLog();

    var response = await DioUtil().request('/record/list');
    record_model result = record_model.fromJson(response);
    return result;
  }

  // 查询详情
  static getDetail(int id) async {
    // 开启日志打印
    DioUtil.instance?.openLog();

    var response = await DioUtil().request('/record/detail${id}');
    record_model result = record_model.fromJson(response);
    return result;
  }

  // 新增
  static add(data) async {
    // 开启日志打印
    DioUtil.instance?.openLog();

    var response = await DioUtil()
        .request('/record/add', method: DioMethod.post, data: data);
    record_model result = record_model.fromJson(response);
    return result;
  }
}
