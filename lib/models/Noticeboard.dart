// To parse this JSON data, do
//
//     final noticeboard = noticeboardFromJson(jsonString);

import 'dart:convert';

// Noticeboard noticeboardFromJson(String str) => Noticeboard.fromJson(json.decode(str));

List<Noticeboard> noticeboardFromJson(data) =>
    List<Noticeboard>.from(data.map((x) => Noticeboard.fromJson(x)));

String noticeboardToJson(Noticeboard data) => json.encode(data.toJson());

class Noticeboard {
  Noticeboard({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
  });

  int id;
  String name;
  String description;
  DateTime date;

  factory Noticeboard.fromJson(Map<String, dynamic> json) => Noticeboard(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
  };
}
