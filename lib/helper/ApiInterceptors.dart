import 'package:dio/dio.dart' as Http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiInterceptors extends Http.Interceptor {
  final box = GetStorage();

  @override
  void onRequest(
      Http.RequestOptions options, Http.RequestInterceptorHandler handler) {
    print('requesting >>>>>>>>>>>>>>>>>>>>>>> ');
    print(box.read("access_token"));
    print(box.read("Cookie"));
    print('requesting >>>>>>>>>>>>>>>>>>>>>>> ');
    options.headers['Cookie'] = '${box.read("Cookie")}';
    options.headers['access_token'] = '${box.read("access_token")}';
    // do something before request is sent
    super.onRequest(options, handler); //add this line
  }

  @override
  void onError(Http.DioError dioError, Http.ErrorInterceptorHandler handler) {
    //handler.next(dioError);
    print('done');
    // do something to error
    showMessage(dioError.message);
    super.onError(dioError, handler); //add this line
  }

  void showMessage(String message) {
    Get.snackbar(
      "Al-Hamd School",
      message,
      icon: Icon(Icons.error, color: Colors.red),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.green,
      duration: Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  // @override
  // void onResponse(
  //     Http.Response response, Http.ResponseInterceptorHandler handler) {
  //   print(response.statusCode);
  //   print('error');
  //   // do something before response
  //   super.onResponse(response, handler); //add this line
  // }

  // @override
  // Future<dynamic> onError(DioError dioError) {
  //   // do something to error
  // }

  // @override
  // Future<dynamic> onResponse(Response response) async {
  //   // do something before response
  // }
}
