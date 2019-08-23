import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/android.dart';
import 'package:flutter_shop/service/service_methon.dart';
import 'package:flutter_shop/widgets/android_item_widget.dart';

class AndroidPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AndroidState();
}

class _AndroidState extends State with AutomaticKeepAliveClientMixin {
  List<AndroidResults> androidData;
  int _index = 1;

  @override
  void initState() {
    super.initState();
    androidData = List();
    _refresh();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android'),
      ),
      body: Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(1920),
        child: EasyRefresh(
          child: listWidget(),
          onLoad: () async {
            _refresh();
          },
        ),
      ),
    );
  }

  // 带滚动条的列表
  Widget listWidget() => ListView.builder(
        itemBuilder: (context, index) {
          return AndroidItemWidget(results: androidData[index]);
        },
        itemCount: androidData.length,
      );

  void _refresh() {
    getAndroidData(_index++).then((data) {
      setState(() {
        Android android = Android.fromJsonMap(data);
        androidData.addAll(android.results);
      });
    });
  }
}
