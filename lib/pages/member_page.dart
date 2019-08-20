import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/female.dart';
import 'package:flutter_shop/service/service_methon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/widgets/member_item_widget.dart';

class MemberPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemberPageState();
}

class _MemberPageState extends State with AutomaticKeepAliveClientMixin {
  int index = 0;
  List<FemaleResults> _data = [];
  ScrollController _controller;

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(1080),
        child: listWidget(),
      ),
    );
  }

  // 列表
  Widget listWidget() => ListView.builder(
        itemBuilder: (context, index) {
          return MemberItemWidget(data: _data[index]);
        },
        itemCount: _data.length,
        controller: _controller,
      );

  void _refresh() {
    getMeinvData(index++).then((data) {
      Female female = Female.fromJsonMap(data);
      setState(() {
        _data.addAll(female.results);
      });
    });
  }
}
