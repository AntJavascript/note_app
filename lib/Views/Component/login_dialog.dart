import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 路由配置
import 'package:note_app/router/application.dart';

class LoginDialog extends StatelessWidget {
   const LoginDialog({super.key});

   @override
  Widget build(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('请先登录'),
          content:Text('检测到你还未登陆，请先登录再进行操作。'),
          actions:<Widget>[
            FlatButton(
              child: Text('去登录'),
              onPressed: (){
                Application.router.navigateTo(context, "/login");
              },
            ),
            FlatButton(
              child: Text('退出应用'),
              onPressed: () async{
                await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
          elevation: 20,
        );
      },
    );
  }
}
