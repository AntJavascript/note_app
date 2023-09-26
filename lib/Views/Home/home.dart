import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

// UI内容组件
import 'package:note_app/Views/Home/Widgets/DateGrid.dart';

// 路由配置
import 'package:note_app/router/application.dart';
// 日期处理函数
import 'package:note_app/Views/Home/Widgets/date.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          : Center(
              child: ElevatedButton(
                  child: const Text("去登录"),
                  onPressed: () {
                    Application.router.navigateTo(context, "/login");
                  }),
            ),
    );
  }
}
