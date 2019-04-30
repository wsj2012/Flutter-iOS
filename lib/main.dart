//my first flutter programe
import 'package:flutter/cupertino.dart';
import 'package:myapp/src/EngwordsPage.dart';
import 'package:myapp/src/SamplePage.dart';
import 'package:myapp/src/FirstPage.dart';
import 'package:myapp/src/ListPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyMainState createState() => new _MyMainState();
}

class _MyMainState extends State<MyApp> {
  // 默认索引第一个tab
  int _tabIndex = 0;

  // 正常情况的字体样式
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));

  // 选中情况的字体样式
  final tabTextStyleSelect = new TextStyle(color: const Color(0xff63ca6c));

  // 底部菜单栏图标数组
  var tabImages;

  // 页面内容
  var _pages;

  // 菜单文案
  var tabTitles = ['推荐', '资讯', '发现', '我的'];

  // 路由map
  Map<String, WidgetBuilder> _routes = new Map();

  // 生成image组件
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('assets/images/ic_nav_news_normal.png'),
          getTabImage('assets/images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('assets/images/ic_nav_tweet_normal.png'),
          getTabImage('assets/images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('assets/images/ic_nav_discover_normal.png'),
          getTabImage('assets/images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('assets/images/ic_nav_my_normal.png'),
          getTabImage('assets/images/ic_nav_my_pressed.png')
        ]
      ];
    }

    _pages = [
      new EngwordsPage("推荐"),
      new SamplePage(),
      new ListWidget("发现"),
      new FirstPage("我的")
    ];
  }

  //获取菜单栏字体样式
  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelect;
    } else {
      return tabTextStyleNormal;
    }
  }

  // 获取图标
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  // 获取标题文本
  Text getTabTitle(int curIndex) {
    return new Text(
      tabTitles[curIndex],
      style: getTabTextStyle(curIndex),
    );
  }

  // 获取BottomNavigationBarItem
  List<BottomNavigationBarItem> getBottomNavigationBarItem() {
    List<BottomNavigationBarItem> list = new List();
    for (int i = 0; i < 4; i++) {
      list.add(new BottomNavigationBarItem(
          icon: getTabIcon(i), title: getTabTitle(i)));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new CupertinoApp(
      title: "Demo",
      theme: new CupertinoThemeData(
        primaryColor: CupertinoColors.darkBackgroundGray,
      ),
      routes: _routes,
      home: new CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: getBottomNavigationBarItem(),
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                child: _pages[index],
                // navigationBar: CupertinoNavigationBar(
                //   middle: Text(tabTitles[index]),
                //   trailing: _trailingButtons[index],
                // ),
              );
            },
          );
        },
      ),
    );
  }
}
