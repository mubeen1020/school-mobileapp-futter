import 'dart:convert';
import 'dart:io';

import 'package:al_hamd_school/models/Messages.dart';
import 'package:al_hamd_school/models/Noticeboard.dart';
import 'package:al_hamd_school/models/ResId.dart';
import 'package:al_hamd_school/models/Student.dart';
import 'package:al_hamd_school/models/feestructure.dart';
import 'package:al_hamd_school/models/introcontactus.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import '../models/User.dart';
import 'package:dio/dio.dart' as Http;
import '../models/attendance.dart';
import 'ApiInterceptors.dart';

class DioClient {
  Http.Dio _http = Http.Dio();
  final box = GetStorage();

  DioClient() {
    _http.interceptors.add(new ApiInterceptors());
  }

  // Future<User?> getUser({required String id}) async {
  //   User? user;
  //   try {
  //     Http.Response userData = await _http.get(${box.read("_baseUrl")} + '/users/$id');
  //     print('User Info: ${userData.data}');
  //     user = User.fromJson(userData.data);
  //   } on Http.DioError catch (e) {
  //     // The request was made and the server responded with a status code
  //     // that falls out of the range of 2xx and is also not 304.
  //     if (e.response != null) {
  //       print('Dio error!');
  //       print('STATUS: ${e.response?.statusCode}');
  //       print('DATA: ${e.response?.data}');
  //       print('HEADERS: ${e.response?.headers}');
  //     } else {
  //       // Error due to setting up or sending the request
  //       print('Error sending request!');
  //       print(e.message);
  //     }
  //   }
  //   return user;
  // }

  Future<List<Student>?> fetchStudet() async {
    List<Student>? student;
    try {
      // Http.Response userData = await _http.get(
      //     "${box.read("_baseUrl")}/api/student.student?fields=['id', 'name']&domain=[('parent_id', 'in', [${box
      //         .read("parent_id")}])]");

      print("parent id ++++++++++++++++++++++++++++++++ ,  ${box
          .read("parent_id")} ");
      Http.Response userData = await _http.get(
          "${box.read("_baseUrl")}/api/student.student?fields=['id', 'name','student_name','gender','date_of_birth','standard_id']&domain=[('parent_id', 'in', [${box
              .read("parent_id")}])]");
      student = studentFromJson(userData.data['data']) ;
    } on Http.DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return student;
  }


  Future<List<Noticeboard>?> getNotices() async {
    List<Noticeboard>? notices;
    try {

      Http.Response userData = await _http.get(
          "${box.read("_baseUrl")}/api/student.reminder?fields=['id','name','description','date']&domain=[('class_id', 'in', [${box.read("StandardId")}])]");
      notices = noticeboardFromJson(userData.data['data']);
    } on Http.DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return notices;
  }

  Future<String?> getparent_id() async {
    String? parent_id;
    try {
      Http.Response userData = await _http.get(
          "${box.read("_baseUrl")}/api/school.parent?domain=[('partner_id', 'in', [${box
              .read("partner_id")}])]");
      parent_id = userData.data['data'][0]['id'].toString();
      print("***********************************************************");
      print(parent_id);
      box.write("parent_id", parent_id);
    } on Http.DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return parent_id;
  }

  Future<Feestructure?> getFeeStructure() async {


    Feestructure? feetructure;
    try {
      Http.Response userData = await _http.get("${box.read("_baseUrl")}/api/student.payslip?fields=['name','number','student_id', 'state' , 'final_amount' , 'date']&domain=[('student_id', 'in', [${box.read("student_id")}])]");
      print("feetructure>>: ${userData.data}");


      feetructure =  Feestructure.fromJson(userData.data);
      print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
      // print("feetructure>>: ${feetructure.data?[0].name}");
    } on Http.DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return feetructure;
  }


  Future<IntroductionContactusModel?> getIntroduction() async {
    IntroductionContactusModel? contactus;
    try {
      Http.Response userData = await _http.get("${box.read("_baseUrl")}/api/introduction?fields=['id','title','description']");

      print("Introduction>>: ${userData.data}");


      contactus =  IntroductionContactusModel.fromJson(userData.data);
      print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
      print("Introduction>>: ${contactus.data[0].description}");
    } on Http.DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return contactus;
  }

  Future<IntroductionContactusModel?> getContactus() async {
    IntroductionContactusModel? contactus;
    try {
      Http.Response userData = await _http.get("${box.read("_baseUrl")}/api/contactus?fields=['id','title','description']");
      print("contactus>>: ${userData.data}");
      contactus =  IntroductionContactusModel.fromJson(userData.data);
      print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
      print("contactus>>: ${contactus.data[0].description}");
    } on Http.DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return contactus;
  }

  Future<int?> getResId() async {

    ResID? response;
    int? id ;
    try {

      Http.Response userData = await _http.get("${box.read("_baseUrl")}/api/mail.channel?fields=['id']&domain=[('name', '=ilike', '%_Parent'),('channel_type','=','chat'),('channel_partner_ids', '=',  ${box.read("partner_id")})]");
      // Http.Response userData = await _http.get("${box.read("_baseUrl")}/api/mail.channel?domain=[('channel_partner_ids', '=', ${box.read("partner_id")}),('channel_type','=','chat')]");
      print("RES ID>>: ${userData}");
      print( box.read("partner_id"));
      // var response = ResID.fromJson(userData.data);
      print("####################################");
      // print("ResID>>: ${userData.data['data'][0]['id']}");ResID
      id = userData.data['data'][0]['id'];
      box.write("ResID",userData.data['data'][0]['id']);
    } on Http.DioError catch (e) {
      // The request was made and the server responded with a status code  fetchUser();
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return id ;
  }



  Future<Messages?> getMessage() async {

    Messages? chatmessage;
    try {
      Http.Response userData = await _http.get("${box.read("_baseUrl")}/api/mail.message?fields=['id', 'body' , 'description', 'author_id']&domain=[('res_id', '=',  ${box.read("ResID")}),('message_type','=','comment')]");
      // Http.Response userData = await _http.get("${box.read("_baseUrl")}/api/mail.message?fields=['id', 'body' , 'description', 'author_id']&domain=[('res_id', '=',  555    ),('message_type','=','comment')]");
      print("Messages>>: ${userData}");

      chatmessage = Messages.fromJson(userData.data);
      print("####################################");
      // print("Messages>>: ${chatmessage.data[0].body}");

    } on Http.DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return chatmessage ;
  }


  Future<bool> SendMessage(String message) async {


    final uri = Uri.parse('${box.read("_baseUrl")}/api/mail.message');


    Map<String, String> headers = {
      "Content-Type": "application/json",
      "access_token": "${box.read("access_token")}",
      "Cookie":box.read("Cookie")
    };

    Map<String, dynamic> body = {
      "author_id": box.read("partner_id"),
      "message_type":"comment",
      "body": "<p> $message </p>".toString(),
      "model": "mail.channel",
      "res_id": box.read("ResID"),
      "subtype_id": 1
    };
    String jsonBody = json.encode(body);
    print(headers);
    print(body);

    var response = await post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {

        print("Messages Send Status >>: ${response.body}");
        print("Messages Send Status >>: ${response.statusCode}");
        return true ;
      }
      else
        {
        return false;
        }



    // try {
    //   Http.Response userData = await _http.post("${box.read("_baseUrl")}/api/mail.message" ,
    //     options: Options(headers: {
    //       HttpHeaders.contentTypeHeader: "application/json" ,
    //       HttpHeaders.authorizationHeader : "Bearer 37950543292c23248cc7a0c3d117f674221787bf" ,
    //     }),
    //     data: jsonEncode(data), );
    //   print("&&&&####**********######*************######");
    //   print("Messages Send Status >>: ${userData}");
    //
    // } on Http.DioError catch (e) {
    //   // The request was made and the server responded with a status code
    //   // that falls out of the range of 2xx and is also not 304.
    //   if (e.response != null) {
    //     print('Dio error!');
    //     print('STATUS: ${e.response?.statusCode}');
    //     print('DATA: ${e.response?.data}');
    //     print('HEADERS: ${e.response?.headers}');
    //   } else {
    //     // Error due to setting up or sending the request
    //     print('Error sending request!');
    //     print(e.message);
    //   }
    // }

  }


  Future<Attendance?> getAttendance() async {

    // var flag = false ;
    Attendance? attendance;
    try {
      Http.Response userData = await _http.get("${box.read("_baseUrl")}/api/daily.attendance.line?domain=[('stud_id', 'in', [${box.read("student_id")}]  ) , ('standard_id' , '!=', False) ]");
      print("Attendance>>: ${userData}");

      attendance = Attendance.fromJson(userData.data);
      print("####################################");
      // print("Attendance>>: ${attendance.data[0]}");

    } on Http.DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return attendance ;

  }




}