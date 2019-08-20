import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  final String _url;

  WebViewPage(this._url) : super();

  @override
  State<StatefulWidget> createState() => WebViewState(_url);
}

class WebViewState extends State<WebViewPage> {
  final String _url;

  WebViewState(this._url) : super();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: _url,
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
      scrollBar: true,
    );
  }
}
