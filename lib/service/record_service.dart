import 'package:note_app/http.dart';
import 'package:note_app/model/record.dart';

class RecordService {
  // 根据日期查询列表
  static getList() async {
    // 开启日志打印
    DioUtil.instance?.openLog();

    var response = await DioUtil().request('/record/list');
    // RecordEntity listData = RecordEntity.fromJson(response);
    // List<RecordEntity> list = [];

    // listData.data!.map((item) {
    //   list.add(item as RecordEntity);
    // }).toList();
    return response;
  }

  // 查询详情
  static getDetail(int id) async {
    // 开启日志打印
    DioUtil.instance?.openLog();

    var response = await DioUtil().request('/record/detail${id}');
    RecordEntity result = RecordEntity.fromJson(response);
    return result;
  }

  // 新增
  static add(data) async {
    // 开启日志打印
    DioUtil.instance?.openLog();

    var response = await DioUtil()
        .request('/record/add', method: DioMethod.post, data: data);
    RecordEntity result = RecordEntity.fromJson(response);
    return result;
  }
}
