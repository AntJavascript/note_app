import 'package:note_app/http.dart';
import 'package:note_app/model/record.dart';

class RecordService {
  // 根据日期查询列表
  getList() async {
    // 开启日志打印
    DioUtil.instance?.openLog();
    
    var res = await DioUtil().request('/record/list');
    RecordEntity listData = RecordEntity.fromJson(res);
    List<RecordEntity> list = [];

    if (listData.data.length > 0) {
      listData.data.map((item) {
        list.add(item);
      }).toList();
    }
    return list;
  }

  // 查询详情
  getDetail(int id) async {
    // 开启日志打印
    DioUtil.instance?.openLog();
    
    var res = await DioUtil().request('/record/detail${id}');
    RecordEntity data = RecordEntity.fromJson(res);
    return data.data;
  }

  // 新增
  add(Map<String dynamic> data) async {
    // 开启日志打印
    DioUtil.instance?.openLog();
    
    var res = await DioUtil().request('/record/add', method: DioMethod.post, data: data);
    RecordEntity data = RecordEntity.fromJson(res);
    return data.data;
  }

}
