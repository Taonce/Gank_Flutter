import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  final String _url;
  final String _title;

  WebViewPage(this._url, this._title) : super();

  @override
  State<StatefulWidget> createState() => WebViewState(_url, _title);
}

class WebViewState extends State<WebViewPage> {
  final String _url;
  final String _title;
  FlutterWebviewPlugin _webviewPlugin;

  WebViewState(this._url, this._title) : super();

  @override
  void initState() {
    _webviewPlugin = FlutterWebviewPlugin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: _url,
      appBar: AppBar(
        title: Text(_title),
      ),
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
      scrollBar: true,
    );
  }
}
