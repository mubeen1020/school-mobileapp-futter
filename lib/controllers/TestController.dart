import 'package:al_hamd_school/helper/DioClient.dart';
import 'package:al_hamd_school/models/Noticeboard.dart';
import 'package:al_hamd_school/models/Student.dart';
import 'package:al_hamd_school/models/User.dart';

import 'package:al_hamd_school/screens/fee/components/fee_body.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/Messages.dart';
import '../models/attendance.dart';
import '../models/feestructure.dart';

class TestController extends GetxController {
  var count = 0;
  var newCount = 0;
  bool isLoading = false;
  final DioClient _client = DioClient();

  User? user;
  List<Student>? students;
  List<Noticeboard>? notices;


  Feestructure? feetructure;
  String? parent_id;
  int? resId ;
  Messages? chatmessages ;
  Attendance? attendance ;
  var StudentPresentList = <String>[];
  var StudentAbsentList = <String>[];

  final box = GetStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading = true;
  }

  @override
  void onReady() async {
    await getparent_id();
    await fetchUser();
    await getResId();

    // getFeeStructure();
    // getMessage();
    // getattendace();await fetchUser();
  }

  @override
  void onClose() {}

  getparent_id() async
  {
    isLoading = true;
    parent_id = await _client.getparent_id();
    print("******===============================================**");
    print(parent_id);
    isLoading = false;
    update();
  }

  fetchUser() async {
    isLoading = true;
    students = await _client.fetchStudet();
    print(students);
    box.write("StandardId", students?[0].standardId[0]);
    students?.insert(0, Student(id: -1, name: "Select student" ,studentName: "Select student" , gender: "male" , dateOfBirth: DateTime(2013-01-17)  ,standardId: <dynamic>[13, "Standrad 7[B]"]));
    isLoading = false;
    update();
  }

  getNotices() async
  {
    isLoading = true;
    notices = await _client.getNotices();
    isLoading = false;
    update();

  }


  getFeeStructure() async {

    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    isLoading = true;
    feetructure = await _client.getFeeStructure();
    isLoading = false;
    update();

  }

  getResId() async {

    isLoading = true;
    resId = await _client.getResId();
    print("-----------------ResID--------------------------------");
    print(resId);
    isLoading = false;
    update();

  }

  getMessage() async {

    isLoading = true;
    chatmessages = await _client.getMessage();
    print("-------------------------------------------------");
    print(chatmessages);
    isLoading = false;

  }

  int get sum => count + newCount;

  void increment() {
    count++;
    update();
  }

  void decrease() {
    count--;
    update();
  }

  void incrementNew() {
    newCount++;
    update();
  }

  getattendace() async {
    isLoading = true;
    StudentPresentList.clear();
    StudentAbsentList.clear();
    print("============================================");

     attendance  = await _client.getAttendance() ;


    print(attendance?.data);
    if(attendance!.count > 0)
      {
        String? date = attendance?.data[0].createDate.toString() ;
        print(date);
        // isLoading = false;

        for(var date in attendance!.data )
        {
          if (date!.isPresent)
          {
            String? split_date = date?.createDate.toString().split(' ').first;
            // String? days = split_date?.split('-').last ;
            print(split_date);
            StudentPresentList.add(split_date!);
          }
          else
          {
            String? split_date = date?.createDate.toString().split(' ').first;
            print(split_date);
            StudentAbsentList.add(split_date!);
          }
        }
      }
     isLoading = false;
    //
  }
}
