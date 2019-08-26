import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleWebViewPage extends StatefulWidget {
  final String url;
  final String title;

  GoogleWebViewPage(this.url, this.title);

  @override
  State<StatefulWidget> createState() =>
      GoogleWebViewPageState(this.url, this.title);
}

class GoogleWebViewPageState extends State<GoogleWebViewPage> {
  final String url;
  final String title;
  WebViewController _controller;

  GoogleWebViewPageState(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: Container(
        width: ScreenUtil().setWidth(1080),
        child: WebView(
          initialUrl: this.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            setState(() {
              _controller = controller;
            });
          },
        ),
      ),
      floatingActionButton: floatingButton(),
    );
  }

  Widget floatingButton() {
    return refreshButton(_controller);
//    return Column(
//      children: <Widget>[
//        goBackButton(_controller),
//        refreshButton(_controller),
//      ],
//    );
  }

  Widget refreshButton(WebViewController controller) {
    return FloatingActionButton(
      onPressed: () {
        controller.reload();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('重新加载'),
        ));
      },
      child: Icon(Icons.refresh),
      backgroundColor: Colors.pinkAccent,
      mini: true,
    );
  }

  Widget goBackButton(WebViewController controller) {
    return FloatingActionButton(
      onPressed: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('已经是第一页咯~~'),
          ));
        }
      },
      child: Icon(Icons.arrow_back),
      backgroundColor: Colors.blueAccent,
      mini: true,
    );
  }
}
