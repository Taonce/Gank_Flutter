import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/widgets/home_banner_widget.dart';
import 'package:flutter_shop/widgets/home_tab_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State with AutomaticKeepAliveClientMixin {
  final List<String> _urls = [
    'https://wanandroid.com/blogimgs/4f66c08e-d8b6-470d-9c8c-eeed9dbfb2a3.png',
    'https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png',
    'https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png',
    'https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png',
  ];

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeBannerWidget(_urls),
          Container(
            height: ScreenUtil().setHeight(260),
            width: ScreenUtil().setWidth(750),
            child: GridView.count(
              crossAxisCount: 5,
              padding: const EdgeInsets.all(5.0),
              children: <Widget>[
                HomeTabWidget(),
                HomeTabWidget(),
                HomeTabWidget(),
                HomeTabWidget(),
                HomeTabWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
