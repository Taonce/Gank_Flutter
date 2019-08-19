import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannerWidget extends StatelessWidget {
  final List<String> _urls;

  HomeBannerWidget(this._urls);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: _urls.length,
        itemBuilder: (context, index) {
          return Image.network(
            _urls[index],
            fit: BoxFit.cover,
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
        duration: 3000,
      ),
    );
  }
}
