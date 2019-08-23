import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/ios.dart';
import 'package:flutter_shop/service/service_methon.dart';
import 'package:flutter_shop/widgets/ios_item_widget.dart';

class IosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IosPagePageState();
}

class _IosPagePageState extends State with AutomaticKeepAliveClientMixin {
  List<IosResults> androidData;
  int index = 1;

  @override
  void initState() {
    androidData = List();
    _refresh();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iOS'),
      ),
      body: Container(
        width: ScreenUtil().setWidth(1080),
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
          return IosItemWidget(results: androidData[index]);
        },
        itemCount: androidData.length,
      );

  // 上拉加载更多
  void _refresh() {
    getIosData(index++).then((data) {
      setState(() {
        Ios android = Ios.fromJsonMap(data);
        androidData.addAll(android.results);
      });
    });
  }
}
