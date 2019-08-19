class Xiandu {
  bool error;
  List<XianduResults> results;

  Xiandu.fromJsonMap(Map<String, dynamic> map)
      : error = map["error"],
        results = List<XianduResults>.from(map["results"].map((it) => XianduResults.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = error;
    data['results'] = results != null ? this.results.map((v) => v.toJson()).toList() : null;
    return data;
  }
}

class XianduResults {
  String _id;
  String content;
  String cover;
  int crawled;
  String created_at;
  bool deleted;
  String published_at;
  String raw;
  Site site;
  String title;
  String uid;
  String url;

  XianduResults.fromJsonMap(Map<String, dynamic> map)
      : _id = map["_id"],
        content = map["content"],
        cover = map["cover"],
        crawled = map["crawled"],
        created_at = map["created_at"],
        deleted = map["deleted"],
        published_at = map["published_at"],
        raw = map["raw"],
        site = Site.fromJsonMap(map["site"]),
        title = map["title"],
        uid = map["uid"],
        url = map["url"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = _id;
    data['content'] = content;
    data['cover'] = cover;
    data['crawled'] = crawled;
    data['created_at'] = created_at;
    data['deleted'] = deleted;
    data['published_at'] = published_at;
    data['raw'] = raw;
    data['site'] = site == null ? null : site.toJson();
    data['title'] = title;
    data['uid'] = uid;
    data['url'] = url;
    return data;
  }
}

class Site {
  String cat_cn;
  String cat_en;
  String desc;
  String feed_id;
  String icon;
  String id;
  String name;
  int subscribers;
  String type;
  String url;

  Site.fromJsonMap(Map<String, dynamic> map)
      : cat_cn = map["cat_cn"],
        cat_en = map["cat_en"],
        desc = map["desc"],
        feed_id = map["feed_id"],
        icon = map["icon"],
        id = map["id"],
        name = map["name"],
        subscribers = map["subscribers"],
        type = map["type"],
        url = map["url"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_cn'] = cat_cn;
    data['cat_en'] = cat_en;
    data['desc'] = desc;
    data['feed_id'] = feed_id;
    data['icon'] = icon;
    data['id'] = id;
    data['name'] = name;
    data['subscribers'] = subscribers;
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}
