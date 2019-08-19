import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/service/service_methon.dart';
import 'package:flutter_shop/widgets/xiandu_list_widget.dart';
import '../entity/category_sec.dart';

class XianduPage extends StatefulWidget {
  final String category;

  XianduPage(this.category);

  @override
  State<StatefulWidget> createState() => XianduState(category);
}

class XianduState extends State<XianduPage>
    with AutomaticKeepAliveClientMixin<XianduPage> {
  final String category;
  List<CategorySecResults> _category = List();
  List<Widget> _categoryWidget = List();
  String id = '';

  XianduState(this.category);

  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 1080,
      height: 1920,
    )..init(context);
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(1920),
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _encodeWidget(),
                  ),
                ),
                XianduWidget(id),
              ],
            );
          } else {
            return Center(
              child: Text('正在加载闲读数据...'),
            );
          }
        },
        future: getSecCategory(),
      ),
    );
  }

  List<Widget> _encodeWidget() {
    _category.forEach((f) {
      _categoryWidget.add(
        Container(
          width: 30,
          height: 30,
          margin: const EdgeInsets.all(5),
          child: InkWell(
            child: CircleAvatar(
              backgroundImage: NetworkImage(f.icon),
            ),
            onTap: () {
              setState(() {
//                id = f.id;
              });
            },
          ),
        ),
      );
    });
    return _categoryWidget;
  }

  Future getSecCategory() async {
    CategorySec categorySec;
    await getXianduCategorySec(category).then((data) {
      categorySec = CategorySec.fromJsonMap(data);
      _category.addAll(categorySec.results);
      id = _category[0].id;
    });
    return categorySec;
  }
}
