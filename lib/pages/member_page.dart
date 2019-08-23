import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/female.dart';
import 'package:flutter_shop/service/service_methon.dart';
import 'package:flutter_shop/widgets/member_item_widget.dart';

class MemberPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemberPageState();
}

class _MemberPageState extends State with AutomaticKeepAliveClientMixin {
  int index = 0;
  List<FemaleResults> _data = [];

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
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

  // 列表
  Widget listWidget() => ListView.builder(
        itemBuilder: (context, index) {
          return MemberItemWidget(data: _data[index]);
        },
        itemCount: _data.length,
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
