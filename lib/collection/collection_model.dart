class Collection {
  static const tblCollection = 'collections';
  static const colId = 'id';
  static const colName = 'name';

  int id;
  String name;

  Collection({this.id, this.name});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{colName: name};
    if (id != null) map[colId] = id;
    return map;
  }

  Collection.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
  }
}
