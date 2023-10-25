import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

// 路由相关
import 'package:note_app/router/application.dart';

// 自定义组件
import 'package:note_app/Views/Home/Widgets/DateGrid.dart'; // 首页
import 'package:note_app/Views/Total/total.dart'; // 统计
import 'package:note_app/Views/Budget/budget.dart'; // 预算
import 'package:note_app/Views/Skin/skin.dart'; // 换肤
import 'package:note_app/Views/Component/bootom_bar.dart'; // 底部导航

// 日期数据函数
import 'package:note_app/tools/date.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              content: Text('检测到你还未登陆，请先登录再进行操作。'),
              actions: <Widget>[
                InkWell(
                  child: Container(
                    margin: EdgeInsets.all(25),
                    child: Text('去登录'),
                  ),
                  onTap: () {
                    Application.router.navigateTo(context, "/login");
                  },
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.all(25),
                    child: Text('退出应用'),
                  ),
                  onTap: () async {
                    await SystemChannels.platform
                        .invokeMethod('SystemNavigator.pop');
                  },
                ),
              ],
              elevation: 20,
            );
          },
        );
      });
    }
  }

  final _pageController = PageController();
  int currentIndex = 0;

  void _onItemTapped(int index) {
    this.setState(() {
      currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  initState() {
    super.initState();
    autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    String title = dateFn(DateTime.now())['dateStr'];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Application.router.navigateTo(context, "/create"); // 跳转创建界面
        },
        child: TailTypo().font_size(12).Text("记一笔"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: isLogin
          ? PageView(
              controller: _pageController,
              onPageChanged: _onItemTapped,
              children: [DateGrid(), TotalPage(), BudgetPage(), SkinPage()],
              physics: NeverScrollableScrollPhysics(), // 禁止滑动
            )
          : null,
      bottomNavigationBar: BottomBar(onClick: _onItemTapped),
    );
  }
}
