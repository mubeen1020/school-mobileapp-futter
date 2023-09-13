import 'package:al_hamd_school/models/Noticeboard.dart';
import 'package:flutter/material.dart';
import 'package:al_hamd_school/components/header.dart';
import 'package:al_hamd_school/components/no_account_text.dart';
import 'package:al_hamd_school/components/socal_card.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';
import '../../../helper/DioClient.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final DioClient _client = DioClient();
  late Future<List<Noticeboard>?> notices;

  @override
  void initState() {
    notices = _client.getNotices() ;
    print("GGGGGGGGGGGGGGGGGGGGGGGG");
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
              title: "Notice Board",
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  // shrinkWrap: true,
                  children: [
                    FutureBuilder<List<Noticeboard>?>(
                      future: notices,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                        print("=========================================");
                        print(snapshot.data?.length);

                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.length,
                            // itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                             return Card(
                                child: ListTile(
                                  // title: Text(snapshot.data![index].date.day.toString()+"-"+snapshot.data![index].date.month.toString()+"-"+snapshot.data![index].date.year.toString() ),
                                    title: Text(DateFormat('dd MMMM yyyy').format(snapshot.data![index].date)),
                                  subtitle: Text(snapshot.data![index].description),
                                ),
                              );
                            },
                          );
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
                    // Card(
                    //   child: ListTile(
                    //     title: Text('1 January 2022'),
                    //     subtitle: Text(
                    //         'School will remain closed in 2 jan 2022, parent and teacher visit the school parent and teacher visit the school. '),
                    //   ),
                    // ),
                    // Card(
                    //   child: ListTile(
                    //     title: Text('1 January 2022'),
                    //     subtitle: Text(
                    //         'School will remain closed in 2 jan 2022, parent and teacher visit the school parent and teacher visit the school. '),
                    //   ),
                    // ),
                    // Card(
                    //   child: ListTile(
                    //     title: Text('1 January 2022'),
                    //     subtitle: Text(
                    //         'School will remain closed in 2 jan 2022, parent and teacher visit the school parent and teacher visit the school. '),
                    //   ),
                    // ),
                    // Card(
                    //   child: ListTile(
                    //     title: Text('1 January 2022'),
                    //     subtitle: Text(
                    //         'School will remain closed in 2 jan 2022, parent and teacher visit the school parent and teacher visit the school. '),
                    //   ),
                    // ),
                    // Card(
                    //   child: ListTile(
                    //     title: Text('1 January 2022'),
                    //     subtitle: Text(
                    //         'School will remain closed in 2 jan 2022, parent and teacher visit the school parent and teacher visit the school. '),
                    //   ),
                    // ),
                    // Card(
                    //   child: ListTile(
                    //     title: Text('1 January 2022'),
                    //     subtitle: Text(
                    //         'School will remain closed in 2 jan 2022, parent and teacher visit the school parent and teacher visit the school. '),
                    //   ),
                    // ),
                    // Card(
                    //   child: ListTile(
                    //     title: Text('1 January 2022'),
                    //     subtitle: Text(
                    //         'School will remain closed in 2 jan 2022, parent and teacher visit the school parent and teacher visit the school. '),
                    //   ),
                    // ),
                    // Card(
                    //   child: ListTile(
                    //     title: Text('1 January 2022'),
                    //     subtitle: Text(
                    //         'School will remain closed in 2 jan 2022, parent and teacher visit the school parent and teacher visit the school. '),
                    //   ),
                    // ),
                    // Card(
                    //   child: ListTile(
                    //     title: Text('1 January 2022'),
                    //     subtitle: Text(
                    //         'School will remain closed in 2 jan 2022, parent and teacher visit the school parent and teacher visit the school. '),
                    //   ),
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
