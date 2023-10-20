import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

// 路由相关
import 'package:note_app/router/application.dart';
import 'package:note_app/router/routes.dart';

// app主题颜色
import 'package:note_app/provider/skin_model.dart';

// 页面组件
import 'package:note_app/Views/Home/home.dart';
import 'package:note_app/Views/Total/total.dart';
import 'package:note_app/Views/Budget/budget.dart';
import 'package:note_app/Views/Skin/skin.dart';

class App extends StatefulWidget {
  App({super.key}) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  final _pageController = PageController();
  int currentIndex = 0;

  bool isLogin = false;

  // 自动登录
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
    
    Map<String, dynamic> dateStr = dateFn(DateTime.now()); // 日期
    String title = "${dateStr["year"]}年${dateStr["month"]}月${dateStr["day"]}日";

    // 创建按钮
    Widget CreateBtn => FloatingActionButton(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      onPressed: () {
        Application.router.navigateTo(context, "/create");
      },
      child: TailTypo().font_size(12).Text("记一笔"),
    )

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<AppSkin>(context).color,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          elevation: 0,
        ),
        bottomNavigationBar: BottomBar(onClick: _onItemTapped),
        floatingActionButton: CreateBtn(),
        body: isLogin ? PageView(
          controller: _pageController,
          onPageChanged: _onItemTapped,
          children: [
            HomePage(),
            TotalPage(),
            BudgetPage(),
            SkinPage(),
          ],
          physics: NeverScrollableScrollPhysics(), // 禁止滑动
        ) : LoginDialog()
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}
