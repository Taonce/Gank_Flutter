import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/util/event_bus.dart';

import '../entity/xiandu.dart';
import '../service/service_methon.dart';
import 'xiandu_item_widget.dart';

class XianduWidget extends StatefulWidget {
  final String id;

  XianduWidget(this.id);

  @override
  State<StatefulWidget> createState() => XianduState(id);
}

// ignore: must_be_immutable
class XianduState extends State<XianduWidget> {
  final String id;

  List<XianduResults> _data = [];
  int index = 1;
  String _id;

  XianduState(this.id);

  @override
  void initState() {
    _id = id;
    getXiandu(_id);
    change();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(1920),
        child: Scrollbar(
          child: EasyRefresh(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return XianduItemWidget(
                  results: _data[index],
                );
              },
              itemCount: _data.length,
            ),
            onLoad: () async {
              getXiandu(_id);
            },
          ),
        ),
      ),
    );
  }

  void getXiandu(String id) {
    getXianduData(id, index++).then((data) {
      Xiandu xiandu = Xiandu.fromJsonMap(data);
      setState(() {
        _data.addAll(xiandu.results);
      });
    });
  }

  void change() {
    bus.on('xianduId', (arg) {
      if (arg == _id) {
        return;
      } else {
        _id = arg;
        index = 1;
        _data.clear();
        getXiandu(_id);
      }
    });
  }
}
