import 'package:flutter/material.dart';
import '../entity/xiandu.dart';
import '../service/service_methon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  ScrollController _controller;

  XianduState(this.id);

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      var position = _controller.position;
      if (position.maxScrollExtent - position.pixels < 50) {
        getXiandu(id);
      }
    });
    getXiandu(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(1920),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return XianduItemWidget(
              results: _data[index],
            );
          },
          itemCount: _data.length,
          controller: _controller,
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
}
