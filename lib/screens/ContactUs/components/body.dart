import 'package:al_hamd_school/models/introcontactus.dart';
import 'package:flutter/material.dart';


import '../../../components/header.dart';
import '../../../helper/DioClient.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _ContactUsState();
}

class _ContactUsState extends State<Body> {
  final DioClient _client = DioClient();
  late Future<IntroductionContactusModel?> contactus;

  @override
  void initState() {
    contactus = _client.getContactus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Header(
            title: "Contact Us",
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: FutureBuilder<IntroductionContactusModel?>(
                future: contactus,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/oops.jpeg'),
                            height: 350,
                          ),
                          Text('Oops! Something went wrong.'),
                        ],
                      ),
                    );
                  } else if (snapshot.hasData) {
                    var contactData = snapshot.data;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Information:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text('Email: school@gmail.com'),
                        Text('Phone: 0000-0000000'),
                        SizedBox(height: 20),
                        Text(
                          'Location:',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text('Federal B Area Karachi'),
                        // You can add more contact information here
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);
//
//   @override
//   State<Body> createState() => _ContactUsState();
// }
//
// class _ContactUsState extends State<Body> {
//   final DioClient _client = DioClient();
//   late Future<IntroductionContactusModel?> contactus;
//
//   @override
//   void initState() {
//     contactus = _client.getContactus();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  SafeArea(
//         child: Column(
//           children: [
//             Header(
//               title: "Contact Us",
//             ),
//             SizedBox(height: SizeConfig.screenHeight * 0.04),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   // shrinkWrap: true,
//                   // shrinkWrap: true,
//                   children: [
//                     FutureBuilder<IntroductionContactusModel?>(
//                       future: contactus,
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//
//                           return Center(
//                             child: RichText(
//                               text: TextSpan(
//                                 style: DefaultTextStyle.of(context).style,
//                                 children: <TextSpan>[
//                                   TextSpan(
//                                     text: 'School Will Remain Close On ',
//                                   ),
//                                   TextSpan(
//                                     text: '14 August 2023',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.red, // Customize the color as needed
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//
//
//
//
//                           // return Text('${snapshot.data?.data[0].description}');
//                         } else {
//                           print(snapshot.error);
//                           if (snapshot.hasError) {
//                             return Center(
//                               child: Image(
//                                 image: AssetImage('assets/images/oops.jpeg'),
//                                 height: 350,
//                               ),
//                             );
//                           } else {
//                             return Center(child: CircularProgressIndicator());
//                           }
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//           ],
//         )
//     );
//   }
// }
