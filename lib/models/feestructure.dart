// To parse this JSON data, do
//
//     final feestructure = feestructureFromJson(jsonString);

import 'dart:convert';

Feestructure feestructureFromJson(String str) => Feestructure.fromJson(json.decode(str));

String feestructureToJson(Feestructure data) => json.encode(data.toJson());

class Feestructure {
  Feestructure({
    required this.count,
    required this.data,
  });

  int count;
  List<Datum> data;

  factory Feestructure.fromJson(Map<String, dynamic> json) => Feestructure(
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
    required this.name,
    required this.number,
    required this.studentId,
    required this.state,
    required this.finalAmount,
    required this.date,
  });

  int id;
  String name;
  String number;
  List<dynamic> studentId;
  String state;
  double  finalAmount;
  DateTime date;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    number: json["number"],
    studentId: List<dynamic>.from(json["student_id"].map((x) => x)),
    state: json["state"],
    finalAmount: json["final_amount"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "number": number,
    "student_id": List<dynamic>.from(studentId.map((x) => x)),
    "state": state,
    "final_amount": finalAmount,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
  };
}



// class feestructure {
//   int? count;
//   List<Data>? data;
//
//   feestructure({this.count, this.data});
//
//   feestructure.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data?.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['count'] = this.count;
//     if (this.data != null) {
//       data['data'] = this.data?.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int? id;
//   String? name;
//   String? number;
//   List<int>? studentId;
//   List<int>? registerId;
//   String? state;
//   double? finalAmount;
//   String? date;
//
//   Data(
//       {this.id,
//         this.name,
//         this.number,
//         this.studentId,
//         this.registerId,
//         this.state,
//         this.finalAmount,
//         this.date});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     number = json['number'];
//     studentId = json['student_id'].cast<int>();
//     registerId = json['register_id'].cast<int>();
//     state = json['state'];
//     finalAmount = json['final_amount'];
//     date = json['date'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['number'] = this.number;
//     data['student_id'] = this.studentId;
//     data['register_id'] = this.registerId;
//     data['state'] = this.state;
//     data['final_amount'] = this.finalAmount;
//     data['date'] = this.date;
//     return data;
//   }
// }