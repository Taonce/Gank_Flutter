import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 5,
        color: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: ScreenUtil().setWidth(95),
              child: Icon(Icons.add),
            ),
            Text('Item'),
          ],
        ),
      ),
    );
  }
}
