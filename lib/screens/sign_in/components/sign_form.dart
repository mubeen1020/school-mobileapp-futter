import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:al_hamd_school/components/custom_surfix_icon.dart';
import 'package:al_hamd_school/components/form_error.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../helper/DioClient.dart';
import '../../../helper/keyboard.dart';
import '../../../size_config.dart';
import '../../dashboard/dashboard_screen.dart';
import 'package:dio/dio.dart' as Http;

class SignForm extends StatefulWidget {

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? database;
  bool? remember = false;
  final List<String?> errors = [];
  final box = GetStorage();
  bool isLoading = false;
  final DioClient _client = DioClient();

  @override
  void initState() {
    print("init state ==============");
    super.initState();
  }

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

   Future<bool> login(String? email , String? password , String? database) async {
    print("=========================================");
    Map<String, dynamic> data = {
      "jsonrpc": "2.0",
      "params": {"db": "Al_hamd_db", "login": "aslam.khan@gmail.com", "password": "123456"}
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json"
    };

    print('${box.read("_baseUrl")}/web/session/authenticate');

    try {
      Response response = await post(
          Uri.parse('${box.read("_baseUrl")}/web/session/authenticate'),
          headers: headers,
          body: json.encode(data));
      print('${box.read("_baseUrl")}/web/session/authenticate');
      print(response);

      if (response.statusCode == 200) {
        String data = response.headers["set-cookie"].toString();
        print("=============================");
        print(data);
        print('web Session Authenticate successfully');
        var cookie = data.split(';');
        print(cookie[0]);
        box.write('Cookie',cookie[0]);
       Future<bool> flag =  gettoken(email , password , database);
       if(await flag)
         {
           return true;
         }
       else{
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           content: Text("Invalid email or password"),
         ));
         return false;
       }
      } else {

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Connection Error"),
        ));
        print('failed');
        return false;
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Connection Error"),
      ));

      return false;
    }
  }

  Future<bool> gettoken(String? email , String? password , String? database) async {

    // Map<String, dynamic> data1 = {
    //   "db": "Al_hamd_db",
    //   "login": "parent@gmail.com",
    //   "password": "12345",
    // };

    // Map<String, dynamic> data1 = {
    //   "db": "TownAl_hamd_db",
    //   "login": "${email}",
    //   "password": "${password}",
    // };

    Map<String, dynamic> data1 = {
      "db": "Al_hamd_db",
      "login": "${email}",
      "password": "${password}",
    };

    print("Second Api call");
    print(" Cookie ==== " +  box.read("Cookie") );

    Map<String, String> cookie1 = {
      "Content-Type": "application/json",
      "Cookie":box.read("Cookie")
    };

    print(data1);
    print('${box.read("_baseUrl")}/api1/auth/token?db=Al_hamd_db');

    Response response1 = await post(
        Uri.parse(
            '${box.read("_baseUrl")}/api1/auth/token?db=Al_hamd_db'),
        headers: cookie1,
        body: json.encode(data1));

    print(response1);

    try {
      if (response1.statusCode == 200) {
        var data = jsonDecode(response1.body);
        print("======== Second API response ================");

        if(data['result'].runtimeType != String)
          {

            String getcookie = response1.headers["set-cookie"].toString();
            print("=============================");
            print(data);
            print('web Session Authenticate successfully');
            var cookie = getcookie.split(';');
            print("Update cookie");
            print(cookie[0]);
            box.write('Cookie',cookie[0]);
            box.write('access_token', data['result']['access_token']);
            box.write("partner_id",data['result']['partner_id']);


            print("============================");
            print(box.read("access_token"));
            print(box.read("partner_id"));
            return true;
          }
        else
          {
            return false;

          }

      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Invalid email or password"),
        ));
        print(response1);
        return false;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid email or password"),
      ));
      print(e.toString());
      return false;
    }

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        print("After clicking the Android Back Button");
        return true ;
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            // buildDBFormField(),
            // SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              children: [
                Spacer(),
              ],
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: "Continue",
              press: ()  {

                // if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  print(isLoading);
                  isLoading
                      ? CircularProgressIndicator()
                      : login(email , password , database).then((value) {
                  if(value)
                    {
                      // setState(() {
                      //   isLoading = true;
                      // });
                      print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
                      KeyboardUtil.hideKeyboard(context);
                      Navigator.pushNamed(context, DashboardScreen.routeName);
                    }
                  else
                    {
                      print("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF");
                      return Text("failed");
                    }

                });

                  // if all are valid then go to success screen
                  // Navigator.pushReplacementNamed(
                  //     context, DashboardScreen.routeName);
                // }
              },
            ),
            // DefaultButton(
            //   text: "Test Screen",
            //   press: () {
            //     // KeyboardUtil.hideKeyboard(context);
            //     _formKey.currentState!.save();
            //     Navigator.pushNamed(context, TestScreen.routeName);
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else
          //   if (value.length < 8) {
          //   addError(error: kShortPassError);
          //   return "";
          // }
          return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      // keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else
          //   if (!emailValidatorRegExp.hasMatch(value)) {
          //   addError(error: kInvalidEmailError);
          //   return "";
          // }
          return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildDBFormField() {
    return TextFormField(
      // keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => database = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else
          //   if (emailValidatorRegExp.hasMatch(value)) {
          //   removeError(error: kInvalidEmailError);
          // }
          return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else
          //   if (!emailValidatorRegExp.hasMatch(value)) {
          //   addError(error: kInvalidEmailError);
          //   return "";
          // }
          return null;
      },
      decoration: InputDecoration(
        labelText: "Database",
        hintText: "Enter your Database",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
