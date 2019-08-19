class Category {
  bool error;
  List<CategoryResults> results;

  Category.fromJsonMap(Map<String, dynamic> map)
      : error = map["error"],
        results = List<CategoryResults>.from(map["results"].map((it) => CategoryResults.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = error;
    data['results'] = results != null ? this.results.map((v) => v.toJson()).toList() : null;
    return data;
  }
}

class CategoryResults {
  String _id;
  String en_name;
  String name;
  int rank;

  CategoryResults.fromJsonMap(Map<String, dynamic> map)
      : _id = map["_id"],
        en_name = map["en_name"],
        name = map["name"],
        rank = map["rank"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = _id;
    data['en_name'] = en_name;
    data['name'] = name;
    data['rank'] = rank;
    return data;
  }
}
