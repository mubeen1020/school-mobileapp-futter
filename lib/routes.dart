
import 'package:al_hamd_school/screens/ContactUs/contactus.dart';
import 'package:al_hamd_school/screens/introduction/introduction.dart';
import 'package:al_hamd_school/screens/messages/message_screen.dart';
import 'package:al_hamd_school/screens/test/test_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:al_hamd_school/screens/attendance_details/attendance_screen.dart';
import 'package:al_hamd_school/screens/cart/cart_screen.dart';
import 'package:al_hamd_school/screens/complete_profile/complete_profile_screen.dart';
import 'package:al_hamd_school/screens/details/details_screen.dart';
import 'package:al_hamd_school/screens/fee/fee_screen.dart';
import 'package:al_hamd_school/screens/forgot_password/forgot_password_screen.dart';
import 'package:al_hamd_school/screens/home/home_screen.dart';
import 'package:al_hamd_school/screens/login_success/login_success_screen.dart';
import 'package:al_hamd_school/screens/notice_board/notice_board_screen.dart';
import 'package:al_hamd_school/screens/otp/otp_screen.dart';
import 'package:al_hamd_school/screens/profile/profile_screen.dart';
import 'package:al_hamd_school/screens/sign_in/sign_in_screen.dart';
import 'package:al_hamd_school/screens/splash/splash_screen.dart';

import 'screens/dashboard/dashboard_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  NoticeBoardScreen.routeName: (context) => NoticeBoardScreen(),
  DashboardScreen.routeName: (context) => DashboardScreen(),
  FeeScreen.routeName: (context) => FeeScreen(),
  AttendaceScreen.routeName: (context) => AttendaceScreen(),
  TestScreen.routeName: (context) => TestScreen(),
  MessagesScreen.routeName: (context) => MessagesScreen(),
  ContactUs.routeName: (context) => ContactUs(),
  Introduction.routeName: (context) => Introduction()
};
