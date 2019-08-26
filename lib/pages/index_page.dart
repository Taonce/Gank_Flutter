import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/home_page.dart';
import 'package:flutter_shop/pages/android_page.dart';
import 'package:flutter_shop/pages/ios_page.dart';
import 'package:flutter_shop/pages/member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexPageState();
}

class _IndexPageState extends State with AutomaticKeepAliveClientMixin {
  final List<BottomNavigationBarItem> _bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Colors.pinkAccent,
      ),
      title: Text(
        '首页',
        style: TextStyle(
          color: Colors.pinkAccent,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.android,
        color: Colors.pinkAccent,
      ),
      title: Text(
        'Android',
        style: TextStyle(
          color: Colors.pinkAccent,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.tablet_mac,
        color: Colors.pinkAccent,
      ),
      title: Text(
        'iOS',
        style: TextStyle(
          color: Colors.pinkAccent,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.photo,
        color: Colors.pinkAccent,
      ),
      title: Text(
        '福利',
        style: TextStyle(
          color: Colors.pinkAccent,
        ),
      ),
    ),
  ];

  final List<Widget> _pages = [
    HomePage(),
    AndroidPage(),
    IosPage(),
    MemberPage(),
  ];

  int _index;

  @override
  void initState() {
    _index = 0;
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 1080,
      height: 1920,
    )..init(context);
    return Scaffold(
      body: IndexedStack(
        children: _pages,
        index: _index,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5.0,
        iconSize: 20.0,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        items: _bottomTabs,
        currentIndex: _index,
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
