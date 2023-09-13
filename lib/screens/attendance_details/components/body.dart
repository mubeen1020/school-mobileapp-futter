import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:al_hamd_school/components/header.dart';
import 'package:al_hamd_school/constants.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

import '../../../controllers/TestController.dart';
import '../../../helper/DioClient.dart';
import '../../../models/attendance.dart';
// import 'utils.dart';

List<DateTime> presentDates = [
  // DateTime(2023, 07, 1),
  // DateTime(2023, 07, 3),
  // DateTime(2023, 07, 4),
  // DateTime(2023, 07, 5),
  // DateTime(2023, 07, 6),
  // DateTime(2023, 07, 9),
  // DateTime(2023, 07, 10),
  // DateTime(2023, 07, 11),
  // DateTime(2023, 07, 15),
  // DateTime(2023, 07, 22),
  // DateTime(2023, 07, 23),
];
List<DateTime> absentDates = [
  // DateTime(2023, 07, 2),
  // DateTime(2023, 07, 7),
  // DateTime(2023, 07, 8),
  // DateTime(2023, 07, 12),
  // DateTime(2023, 07, 13),
  // DateTime(2023, 07, 14),
  // DateTime(2023, 07, 16),
  // DateTime(2023, 07, 17),
  // DateTime(2023, 07, 18),
  // DateTime(2023, 07, 19),
  // DateTime(2023, 07, 20),
];


class Body extends StatefulWidget {
  TestController? controller;
  Body(this.controller);
  @override
  State<Body> createState() => _BodyState();
  // State<Body> createState() => _BodyState();

}


class _BodyState extends State<Body> {

  TestController? controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
  }


  static Widget _presentIcon(String day) => CircleAvatar(
    backgroundColor: Colors.green,
    child: Text(
      day,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
  static Widget _absentIcon(String day) => CircleAvatar(
    backgroundColor: Colors.red,
    child: Text(
      day,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );


  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  late CalendarCarousel _calendarCarouselNoHeader;

  // var len = min(absentDates.length, presentDates.length);
  late double cHeight;

  @override
  Widget build(BuildContext context) {

    presentDates.clear();
    absentDates.clear();

    print("==========================================================");

    for (var day in this.controller!.StudentPresentList)
      {
        presentDates.add(DateTime.parse(day)) ;

      }
    for (var day in this.controller!.StudentAbsentList)
    {
      absentDates.add(DateTime.parse(day)) ;

    }
   print(   presentDates.toString() );
    print(   absentDates.toString() );


    cHeight = MediaQuery.of(context).size.height;
    for (int i = 0; i < presentDates.length; i++) {
      _markedDateMap.add(
        presentDates[i],
        new Event(
          date: presentDates[i],
          title: 'Event 5',
          icon: _presentIcon(
            presentDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < absentDates.length; i++) {
      _markedDateMap.add(
        absentDates[i],
        new Event(
          date: absentDates[i],
          title: 'Event 5',
          icon: _absentIcon(
            absentDates[i].day.toString(),
          ),
        ),
      );
    }

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.54,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      // todayButtonColor: Colors.blue,
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:
      null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calender"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _calendarCarouselNoHeader,
            markerRepresent(Colors.red, "Absent"),
            markerRepresent(Colors.green, "Present"),
          ],
        ),
      ),
    );
  }

  Widget markerRepresent(Color color, String data) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.022,
      ),
      title: new Text(
        data,
      ),
    );
  }



//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   TestController? controller;
//   _BodyState(this.controller);
//
//
//
//
//
//
//
//
//   List<Event> _getEventsForDay(DateTime day) {
//
// for (var date in this.controller!.StudentAbsentList )
//   {
//     DateTime ev = DateTime.parse(date);
//
//     if (day.year == ev.year && day.month == ev.month && day.day == ev.day) {
//       Event ev = new Event('Adsent');
//       return [ev];
//     }
//
//   }
//
//     return [];
//   }
//
//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//
//   }
//
//   bool _checkIsPresent(DateTime day) {
//
//     this.controller?.StudentPresentList.sort();
//     this.controller?.StudentPresentList.toSet().toList();
//     print(this.controller?.StudentPresentList);
//
//     var l = <int>[];
//     for (var day in this.controller!.StudentPresentList)
//       {
//         l.add(day);
//       }
//     // return this.controller!.StudentPresentList.any((i) => i == day.day);
//     print(this.controller?.StudentPresentList.cast<int>().runtimeType);
//     print(l.runtimeType);
//     return this.controller!.StudentPresentList.any((i) => i == day.day);
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: SizedBox(
//       width: double.infinity,
//       height: double.maxFinite,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Header(
//               title: "Attendance",
//             ),
//             TableCalendar(
//               firstDay: DateTime.utc(2010, 10, 16),
//               lastDay: DateTime.utc(2030, 3, 14),
//               focusedDay: DateTime.now(),
//               eventLoader: _getEventsForDay,
//               onDaySelected: _onDaySelected,
//               calendarFormat: _calendarFormat,
//               holidayPredicate: _checkIsPresent,
//
//               headerVisible: true,
//               // Calendar Dates styling
//               calendarStyle: const CalendarStyle(
//                 // Weekend dates color (Sat & Sun Column)
//                 weekendTextStyle: TextStyle(color: Colors.red),
//                 outsideTextStyle: TextStyle(color: Colors.green),
//                 defaultTextStyle: TextStyle(color: Colors.green),
//                 markerSizeScale: 0.3,
//                 holidayDecoration: BoxDecoration(
//                     border: const Border.fromBorderSide(
//                         const BorderSide(color: Colors.green, width: 1.4)),
//                     shape: BoxShape.circle),
//                 markerDecoration:
//                     BoxDecoration(color: Colors.red, shape: BoxShape.circle),
//
//                 // highlighted color for selected day
//                 selectedDecoration: BoxDecoration(
//                   color: kPrimaryColor,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }
}
