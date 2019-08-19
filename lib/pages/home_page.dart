import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/category.dart';
import 'package:flutter_shop/service/service_methon.dart';
import 'xiandu_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with
        AutomaticKeepAliveClientMixin<HomePage>,
        SingleTickerProviderStateMixin<HomePage> {
  List<CategoryResults> _category = List();
  List<Tab> _title = List();
  List<XianduPage> _pages = List();
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 1080,
      height: 1920,
    )..init(context);
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (_pageController == null) {
            _pageController = PageController();
          }
          if (_tabController == null) {
            _tabController = TabController(length: _pages.length, vsync: this);
            _tabController.addListener(() {
              if (_tabController.indexIsChanging) {
                _pageController.animateToPage(
                  _tabController.index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.decelerate,
                );
              }
            });
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('闲读'),
              bottom: TabBar(
                tabs: _title,
                controller: _tabController,
                isScrollable: true,
              ),
            ),
            body: PageView(
              children: _pages,
              controller: _pageController,
              onPageChanged: (index) {
                _tabController.index = index;
              },
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('闲读'),
            ),
            body: Center(
              child: Text('分类加载中...'),
            ),
          );
        }
      },
      future: getCategory(),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future getCategory() async {
    Category category;
    await getXianduCategory().then((data) {
      category = Category.fromJsonMap(data);
      _category.addAll(category.results);
      _category.forEach((f) {
        _title.add(Tab(
          text: f.name,
        ));
        _pages.add(XianduPage(f.en_name));
      });
    });
    return category;
  }
}
