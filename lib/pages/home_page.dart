import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/category.dart';
import 'package:flutter_shop/service/service_methon.dart';

import 'xiandu_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage>, SingleTickerProviderStateMixin<HomePage> {
  List<CategoryResults> _category = [];
  List<Tab> _title = [];
  List<XianduPage> _pages = [];
  TabController _tabController;
  Future _future;

  @override
  void initState() {
    _future = getCategory();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (_tabController == null) {
            _tabController = TabController(length: _pages.length, vsync: this);
          }
          return haveDataScaffold();
        } else {
          return notHaveDataScaffold();
        }
      },
      future: _future,
    );
  }

  Widget haveDataScaffold() => Scaffold(
        appBar: AppBar(
          title: Text('闲读'),
          bottom: TabBar(
            tabs: _title,
            controller: _tabController,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: _pages,
          controller: _tabController,
        ),
      );

  Widget notHaveDataScaffold() => Scaffold(
        appBar: AppBar(
          title: Text('闲读'),
        ),
        body: Center(
          child: Text('分类加载中...'),
        ),
      );

  @override
  bool get wantKeepAlive => true;

  Future getCategory() async {
    if (_category.isNotEmpty) {
      _category.clear();
    }
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
