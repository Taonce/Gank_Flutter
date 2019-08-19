class CategorySec {
  bool error;
  List<CategorySecResults> results;

  CategorySec.fromJsonMap(Map<String, dynamic> map)
      : error = map["error"],
        results = List<CategorySecResults>.from(map["results"].map((it) => CategorySecResults.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = error;
    data['results'] = results != null ? this.results.map((v) => v.toJson()).toList() : null;
    return data;
  }
}

class CategorySecResults {
  String _id;
  String created_at;
  String icon;
  String id;
  String title;

  CategorySecResults.fromJsonMap(Map<String, dynamic> map)
      : _id = map["_id"],
        created_at = map["created_at"],
        icon = map["icon"],
        id = map["id"],
        title = map["title"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = _id;
    data['created_at'] = created_at;
    data['icon'] = icon;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
