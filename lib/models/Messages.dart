class Messages {
  Messages({
    required this.count,
    required this.data,
  });
  late final int count;
  late final List<Data> data;

  Messages.fromJson(Map<String, dynamic> json){
    count = json['count'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.body,
    required this.description,
    required this.authorId,
  });
  late final int id;
  late final String body;
  late final String description;
  late final List<String> authorId;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    body = json['body'];
    description = json['description'];
    authorId = List.castFrom<dynamic, String>(json['author_id']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['body'] = body;
    _data['description'] = description;
    _data['author_id'] = authorId;
    return _data;
  }
}