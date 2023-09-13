// To parse this JSON data, do
//
//     final introductionContactusModel = introductionContactusModelFromJson(jsonString);

import 'dart:convert';

IntroductionContactusModel introductionContactusModelFromJson(String str) => IntroductionContactusModel.fromJson(json.decode(str));

String introductionContactusModelToJson(IntroductionContactusModel data) => json.encode(data.toJson());

class IntroductionContactusModel {
  IntroductionContactusModel({
    required this.count,
    required this.data,
  });

  int count;
  List<Datum> data;

  factory IntroductionContactusModel.fromJson(Map<String, dynamic> json) => IntroductionContactusModel(
    count: json["count"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.description,
  });

  int id;
  String title;
  String description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
  };
}
