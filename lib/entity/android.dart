class Android {
  bool error;
  List<AndroidResults> results;

  Android.fromJsonMap(Map<String, dynamic> map)
      : error = map["error"],
        results = List<AndroidResults>.from(
            map["results"].map((it) => AndroidResults.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = error;
    data['results'] =
        results != null ? this.results.map((v) => v.toJson()).toList() : null;
    return data;
  }
}

class AndroidResults {
  String _id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  bool used;
  String who;

  AndroidResults.fromJsonMap(Map<String, dynamic> map)
      : _id = map["_id"],
        createdAt = map["createdAt"],
        desc = map["desc"],
        publishedAt = map["publishedAt"],
        source = map["source"],
        type = map["type"],
        url = map["url"],
        used = map["used"],
        who = map["who"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = _id;
    data['createdAt'] = createdAt;
    data['desc'] = desc;
    data['publishedAt'] = publishedAt;
    data['source'] = source;
    data['type'] = type;
    data['url'] = url;
    data['used'] = used;
    data['who'] = who;
    return data;
  }
}
