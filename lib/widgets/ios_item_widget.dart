import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/ios.dart';
import 'package:flutter_shop/pages/google_webview_page.dart';
import 'package:flutter_shop/pages/webview_page.dart';

class IosItemWidget extends StatelessWidget {
  final IosResults results;

  IosItemWidget({Key key, this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
//            return WebViewPage(results.url);
            return GoogleWebViewPage(results.url, results.desc);
          }),
        );
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleWidget(),
            timeWidget(),
            authorWidget(),
          ],
        ),
      ),
    );
  }

  // 标题行
  Widget titleWidget() => Container(
        padding: const EdgeInsets.all(5),
        child: Text(
          results.desc,
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
        padding: const EdgeInsets.all(5),
        child: Text(
          results.publishedAt,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );

  // 作者行
  Widget authorWidget() => Container(
        padding: const EdgeInsets.all(5),
        child: Text(
          results.who,
          style: TextStyle(
            fontSize: 12,
            color: Colors.pinkAccent,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
}
