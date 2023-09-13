import 'dart:convert';

List<Student> studentFromJson(data) =>
    List<Student>.from(data.map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
  Student({
    required this.id,
    required this.name,
    required this.studentName,
    required this.gender,
    required this.dateOfBirth,
    required this.standardId,
  });

  int id;
  String name;
  String studentName;
  String gender;
  DateTime dateOfBirth;
  List<dynamic> standardId;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        name: json["name"],
        studentName: json["student_name"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        standardId: List<dynamic>.from(json["standard_id"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "student_name": studentName,
        "gender": gender,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "standard_id": List<dynamic>.from(standardId.map((x) => x)),
      };
}
