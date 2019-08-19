import 'package:flutter/material.dart';
import '../entity/xiandu.dart';
import '../service/service_methon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'xiandu_item_widget.dart';

// ignore: must_be_immutable
class XianduWidget extends StatelessWidget {
  final String id;

  List<XianduResults> _data = List();
  int index = 1;

  XianduWidget(this.id);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil()..init(context);
    return Container(
      width: ScreenUtil().setWidth(1080),
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return XianduItemWidget(
                  results: _data[index],
                );
              },
              itemCount: _data.length,
            );
          } else {
            return Center();
          }
        },
        future: getXiandu(id),
      ),
    );
  }

  Future getXiandu(String id) async {
    Xiandu xiandu;
    await getXianduData(id, index++).then((data) {
      xiandu = Xiandu.fromJsonMap(data);
      _data.addAll(xiandu.results);
    });
    return xiandu;
  }
}
