import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/xiandu.dart';
import 'package:flutter_shop/pages/webview_page.dart';

class XianduItemWidget extends StatelessWidget {
  final XianduResults results;

  XianduItemWidget({Key key, this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toWebView(context);
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleWidget(),
            timeWidget(),
          ],
        ),
      ),
    );
  }

  // 标题行
  Widget titleWidget() => Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          results.title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );

  // 时间行
  Widget timeWidget() => Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          results.published_at,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );

  // 跳转到H5
  void toWebView(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return WebViewPage(results.url);
      }),
    );
  }
}
