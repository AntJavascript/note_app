import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 路由相关
import 'package:note_app/router/application.dart';

// 自定义组件
import 'package:note_app/Views/Home/Widgets/DateGrid.dart';
import 'package:note_app/Views/Component/login_dialog.dart';

// 日期数据函数
import 'package:note_app/tools/date.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dateStr = dateFn(DateTime.now())['dateStr']; // 默认当天

  bool isLogin = false;
// 是否登录过
  void autoLogin() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    var access_token = prefer.getString("access_token");
    var refresh_token = prefer.getString("refresh_token");

    // 存在token,
    if (access_token != null && refresh_token != null) {
      setState(() {
        isLogin = true;
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
         showDialog(
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
  }

  @override
  initState() {
    super.initState();
    autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> dateStr = dateFn(DateTime.now()); // 日期数据
    String title = "${dateStr["year"]}年${dateStr["month"]}月${dateStr["day"]}日";
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Application.router.navigateTo(context, "/create"); // 跳转创建界面
        },
        child: TailTypo().font_size(12).Text("记一笔"),
      ),
      body: isLogin
          ? const DateGrid()
          : null,
    );
  }
}
