import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/female.dart';
import 'package:flutter_shop/pages/full_screen_image_page.dart';

class MemberItemWidget extends StatelessWidget {
  final FemaleResults data;

  MemberItemWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 1080,
      height: 1920,
    )..init(context);
    return GestureDetector(
      child: Container(
        width: ScreenUtil().setWidth(1060),
        margin: const EdgeInsets.all(10),
        child: Image.network(
          data.url,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return FullScreenImagePage(
              url: data.url,
            );
          }),
        );
      },
    );
  }
}
