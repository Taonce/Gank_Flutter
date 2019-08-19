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

class _IndexPageState extends State with SingleTickerProviderStateMixin {
  final List<BottomNavigationBarItem> _bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.android),
      title: Text('Android'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.tablet_mac),
      title: Text('iOS'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('福利'),
    ),
  ];

  final List<Widget> _pages = [
    HomePage(),
    AndroidPage(),
    IosPage(),
    MemberPage(),
  ];

  int _index = 0;

  @override
  void initState() {
    _index = 0;
    super.initState();
  }

  @override
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
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
