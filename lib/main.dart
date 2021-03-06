import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_provider/store/index.dart' show Store;
// import 'package:flutter_provider/page/firstPage.dart' show FirstPage;


// com  => 无视图的组件
import 'com/screen.dart'; // 屏幕适配

// page => 路由页面
import 'page/NewGroup.dart';
import 'page/NewRadio.dart';
import 'page/Contact.dart';
import 'page/Favorites.dart';
import 'page/Invite.dart';
import 'page/Setting.dart';
import 'page/Statement.dart';
import 'page/Chat.dart';
import 'page/Radio.dart';

// view => 视图组件
import 'view/DrawerLt.dart'; // Drawer-ListTile
import 'view/BoxAppBar.dart'; // AppBar
import 'view/BoxBottomNavigationBar.dart'; // BottomNavigationBar


// Store => 集中状态管理
import './store/index.dart';


// 程序入口
void main() => runApp(ChangeNotifierProvider(
  builder: (context) => DataInfo(),
  child: MyApp(),
));


// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  MyApp() {
    Screen(); // 屏幕设置
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boxchat',
      // home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      initialRoute: "/",
      routes: { // 路由表
        "/": (context) => Home(),
        "NewGroup": (context) => RouterNewGroup(),
        "NewRadio": (context) => RouterNewRadio(),
        "Contact": (context) => RouterContact(),
        "Favorites": (context) => RouterFavorites(),
        "Invite": (context) => RouterInvite(),
        "Setting": (context) => RouterSetting(),
        "Statement": (context) => RouterStatement(),
      }
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Home> {
  
  List _indexPageList = [RouteChat(), RouteRadio()];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BoxAppBar(),
      drawer: _drawer(context),
      body: _indexPageList[Provider.of<DataInfo>(context).getIndexNow()],
      bottomNavigationBar: BoxBottomNavigationBar(),


      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          // _indexPage = 1;
        }),
        tooltip: 'Fucking this!',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

   Drawer _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            accountName: Text(
              "Mathon",
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            accountEmail: Text(
              "+86 150-8840-3722",
              style: TextStyle(
                color: Colors.purple[100],
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("asset/images/Mathon.jpg"),
            ),
          ),

          DrawerLt('新建群组', Icon(Icons.group), 'NewGroup'),
          DrawerLt('新建电台', Icon(Icons.radio), 'NewRadio'),

          Divider(), // 横线
          
          DrawerLt('联系人', Icon(Icons.contact_phone), 'Contact'),
          DrawerLt('收藏夹', Icon(Icons.turned_in), 'Favorites'),
          DrawerLt('邀请朋友', Icon(Icons.weekend), 'Invite'),
          DrawerLt('设置', Icon(Icons.settings), 'Setting'),
          DrawerLt('软件声明', Icon(Icons.info), 'Statement'),

        ],
      ),

    );
  }


}


// 抽屉
class HomePageState extends StatefulWidget {
  HomePageState({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      drawer: _drawer,
    );
  }

  get _appbar=>AppBar(
    title: Text('Drawer Test'),
  );

  get _drawer =>Drawer(
    child: Text('This is Drawer'),
  );

}
