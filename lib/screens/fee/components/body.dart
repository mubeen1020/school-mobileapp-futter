import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:al_hamd_school/components/header.dart';
import 'package:al_hamd_school/screens/fee/components/fee_body.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../../constants.dart';
import '../../../controllers/TestController.dart';
import '../../../helper/DioClient.dart';
import '../../../models/Messages.dart';
import '../../../models/data.dart';
import '../../../models/feestructure.dart';
import '../../../models/post.dart';
import '../../../size_config.dart';

import 'package:dio/dio.dart' as Http;

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final DioClient _client = DioClient();
  late Future<Feestructure?> feetructure;

  // late Future<List<Data1>> getdata ;
  //
  //
  // Future<List<Data1>> fetchData() async {
  //   var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
  //   final response = await get(url);
  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     print("+000000000000000000000000") ;
  //     print(jsonResponse );
  //     return jsonResponse.map((data) => Data1.fromJson(data)).toList();
  //   } else {
  //     throw Exception('Unexpected error occured!');
  //   }
  // }

  @override
  void initState() {
    // getdata = fetchData() ;
    feetructure = _client.getFeeStructure();
    print("=================================");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Header(
              title: "Fee History",
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  // shrinkWrap: true,
                  children: [
                    FutureBuilder<Feestructure?>(
                      future: feetructure,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {

                          if(snapshot.data!.count! > 0)
                            {
                              return  ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data?.count,
                                // itemCount: 5,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return new FeeBody(
                                    type:
                                    snapshot.data?.data?[index].name.toString(),
                                    month:
                                    snapshot.data?.data?[index].date.toString().split(" ").first,
                                    status: snapshot.data?.data?[index].state,
                                    amount: snapshot.data?.data?[index].finalAmount.toString()  ,
                                  );
                                },
                              );
                            }
                          else
                            {
                              return Center(
                                child: Text(
                                  'No records found.',
                                  style: TextStyle(fontSize: 18),
                                ),
                              );
                            }

                        } else {
                          print(snapshot.error);
                          if (snapshot.hasError) {
                            return Center(
                              child: Image(
                                image: AssetImage('assets/images/oops.jpeg'),
                                height: 350,
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }
                      },
                    ),

                    //   ListView.builder(
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemCount: controller?.feetructure?.count,
                    //     // itemCount: 5,
                    //   shrinkWrap: true,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return
                    //       FeeBody(
                    //         type: controller?.feetructure?.data?[index].name,
                    //         month: controller?.feetructure?.data?[index].date.toString(),
                    //         status: controller?.feetructure?.data?[index].state,
                    //         amount: controller?.feetructure?.data?[index].finalAmount,
                    //       )
                    //   },
                    // ),

                    //
                    // FeeBody(
                    //   type: "Monthly Fee",
                    //   month: "Feb 2022",
                    //   status: 'Unpaid',
                    //   amount: "Rs. 5200",
                    // ),
                    // // FeeBody(
                    //   type: "Lab Fee",
                    //   month: "March 2022",
                    //   status: 'Unpaid',
                    //   amount: "Rs. 50000",
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
