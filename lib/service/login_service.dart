import 'package:note_app/http.dart';
import 'package:note_app/model/common.dart';

class LoginService {
  // 登录
  login(Map<String dynamic> data) async {
    // 开启日志打印
    DioUtil.instance?.openLog();
    
    var response = await DioUtil().request('/user/login', method: DioMethod.post, data: data);
    CommonEntity result = CommonEntity.fromJson(response);
    return result;
  }

  // 注册
  register(Map<String dynamic> data) async {
    // 开启日志打印
    DioUtil.instance?.openLog();
    
    var response = await DioUtil().request('/user/register'method: DioMethod.post, data: data);
    CommonEntity result = CommonEntity.fromJson(response);
    return result;
  }

}
