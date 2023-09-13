class Data1 {
  final int userId;
  final int id;
  final String title;

  Data1({required this.userId, required this.id, required this.title});

  factory Data1.fromJson(Map<String, dynamic> json) {
    return Data1(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}