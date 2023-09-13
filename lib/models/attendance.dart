// To parse this JSON data, do
//
//     final attendance = attendanceFromJson(jsonString);

import 'dart:convert';

Attendance attendanceFromJson(String str) => Attendance.fromJson(json.decode(str));

String attendanceToJson(Attendance data) => json.encode(data.toJson());

class Attendance {
  Attendance({
    required this.count,
    required this.data,
  });

  int count;
  List<Datum> data;

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
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
    required this.isPresent,
    required this.isAbsent,
    required this.createDate,
  });

  int id;
  bool isPresent;
  bool isAbsent;
  DateTime createDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    isPresent: json["is_present"],
    isAbsent: json["is_absent"],
    createDate: DateTime.parse(json["create_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_present": isPresent,
    "is_absent": isAbsent,
    "create_date": createDate.toIso8601String(),
  };
}

// class Attendance {
//   Attendance({
//     required this.count,
//     required this.data,
//   });
//   late final int count;
//   late final List<Data> data;
//
//   Attendance.fromJson(Map<String, dynamic> json){
//     count = json['count'];
//     data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['count'] = count;
//     _data['data'] = data.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Data {
//   Data({
//     required this.id,
//     required this.rollNo,
//     required this.standardId,
//     required this.studId,
//     required this.isPresent,
//     required this.isAbsent,
//     required this.presentAbsentcheck,
//     required this.LastUpdate,
//     required this.displayName,
//     required this.createUid,
//     required this.createDate,
//     required this.writeUid,
//     required this.writeDate,
//   });
//   late final int id;
//   late final int rollNo;
//   late final List<num> standardId;
//   late final List<num> studId;
//   late final bool isPresent;
//   late final bool isAbsent;
//   late final bool presentAbsentcheck;
//   late final String LastUpdate;
//   late final String displayName;
//   late final List<num> createUid;
//   late final String createDate;
//   late final List<num> writeUid;
//   late final String writeDate;
//
//   Data.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     rollNo = json['roll_no'];
//     standardId = List.castFrom<dynamic, num>(json['standard_id']);
//     studId = List.castFrom<dynamic, num>(json['stud_id']);
//     isPresent = json['is_present'];
//     isAbsent = json['is_absent'];
//     presentAbsentcheck = json['present_absentcheck'];
//     LastUpdate = json['__last_update'];
//     displayName = json['display_name'];
//     createUid = List.castFrom<dynamic, num>(json['create_uid']);
//     createDate = json['create_date'];
//     writeUid = List.castFrom<dynamic, num>(json['write_uid']);
//     writeDate = json['write_date'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['roll_no'] = rollNo;
//     _data['standard_id'] = standardId;
//     _data['stud_id'] = studId;
//     _data['is_present'] = isPresent;
//     _data['is_absent'] = isAbsent;
//     _data['present_absentcheck'] = presentAbsentcheck;
//     _data['__last_update'] = LastUpdate;
//     _data['display_name'] = displayName;
//     _data['create_uid'] = createUid;
//     _data['create_date'] = createDate;
//     _data['write_uid'] = writeUid;
//     _data['write_date'] = writeDate;
//     return _data;
//   }
// }