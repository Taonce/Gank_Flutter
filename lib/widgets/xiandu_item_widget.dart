import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/xiandu.dart';

class XianduItemWidget extends StatelessWidget {
  final XianduResults results;

  XianduItemWidget({Key key, this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 1080,
      height: 100,
    )..init(context);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              results.title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              results.published_at,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
//          Container(
//            padding: const EdgeInsets.all(5),
//            child: Text(
//              results.who,
//              style: TextStyle(
//                fontSize: 12,
//                color: Colors.pinkAccent,
//              ),
//              maxLines: 1,
//              overflow: TextOverflow.ellipsis,
//            ),
//          ),
        ],
      ),
    );
  }
}
