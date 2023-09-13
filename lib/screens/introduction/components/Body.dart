import 'package:flutter/material.dart';

import '../../../components/header.dart';
import '../../../helper/DioClient.dart';
import '../../../models/introcontactus.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
    const Body({Key? key}) : super(key: key);

    @override
    State<Body> createState() => _BodyState();
  }

  class _BodyState extends State<Body> {
    final DioClient _client = DioClient();
    late Future<IntroductionContactusModel?> introduction;

    @override
    void initState() {
      introduction = _client.getIntroduction();
      super.initState();
    }


    @override
    Widget build(BuildContext context) {
      return  SafeArea(
          child: Column(
            children: [
              Header(
                title: "Introduction",
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    // shrinkWrap: true,
                    children: [
                      FutureBuilder<IntroductionContactusModel?>(
                        future: introduction,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {

                            return  Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '${snapshot.data?.data[0].title}',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8 ,),
                                    child: Text(
                                      '${snapshot.data?.data[0].description}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ) ;

                          //   print("${snapshot.data?.data[0].description}");
                          //
                          //
                          // return Text('${snapshot.data?.data[0].description}');

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
                    ],
                  ),
                ),
              ),

            ],
          )
      );
    }
  }
