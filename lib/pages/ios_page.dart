import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/ios.dart';
import 'package:flutter_shop/service/service_methon.dart';
import 'package:flutter_shop/widgets/ios_item_widget.dart';

class IosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IosPagePageState();
}

class _IosPagePageState extends State with AutomaticKeepAliveClientMixin {
  ScrollController _controller;
  List<IosResults> androidData = List();
  int index = 1;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      var position = _controller.position;
      if (position.maxScrollExtent - position.pixels < 50) {
        _refresh();
      }
    });
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
        centerTitle: true,
      ),
      body: Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(1920),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return IosItemWidget(results: androidData[index]);
          },
          itemCount: androidData.length,
          controller: _controller,
        ),
      ),
    );
  }

  void _refresh() {
    getIosData(index++).then((data) {
      setState(() {
        Ios android = Ios.fromJsonMap(data);
        androidData.addAll(android.results);
      });
    });
  }
}
