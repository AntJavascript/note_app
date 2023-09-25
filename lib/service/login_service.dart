import 'dart:convert';

import 'package:note_app/http.dart';
import 'package:note_app/model/common.dart';
import 'package:note_app/model/login_model.dart';

class LoginService {
  // 登录
  static login(data) async {
    // 开启日志打印
    DioUtil.instance?.openLog();

    var response = await DioUtil()
        .request('/user/login', method: DioMethod.post, data: data);
    login_model result = login_model.fromJson(response);
    return result;
  }

  // 注册
  register(data) async {
    // 开启日志打印
    DioUtil.instance?.openLog();

    var response = await DioUtil()
        .request('/user/register', method: DioMethod.post, data: data);
    CommonEntity result = CommonEntity.fromJson(response);
    return result;
  }
}
