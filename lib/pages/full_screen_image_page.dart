import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullScreenImagePage extends StatelessWidget {
  final String url;

  FullScreenImagePage({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(1920),
        child: Image.network(
          url,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
