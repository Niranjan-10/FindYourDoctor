import 'package:flutter/material.dart';
// import 'package:fyd/screens/doctor_CreateProfile_screen.dart' as prefix0;
import 'package:fyd/screens/welcome_screen.dart';
import 'package:fyd/screens/login_user.dart';
import 'package:fyd/screens/departments_screen.dart';
import 'package:fyd/screens/doctor_register_screen.dart';
import 'package:fyd/screens/create_profile_screen.dart';
import 'package:fyd/screens/doctor_home_screen.dart';
import 'package:fyd/screens/doctor_dashboard_screen.dart';
import 'package:fyd/screens/doctor_CreateProfile_screen.dart';
import 'package:fyd/screens/doctor_login_screen.dart';
import 'package:fyd/screens/doctor_viewprofile_screen.dart';
import 'package:fyd/screens/doctors_location_screen.dart';
import 'package:fyd/screens/user_appointmentrequest_screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Location(),
      routes: <String, WidgetBuilder>{
        Departments.id : (context)=> Departments(),
        LoginUser.id : (context)=> LoginUser(),
        DoctorProfile.id :(context)=> DoctorProfile(),
        DoctorHomeScreen.id :(context)=>DoctorHomeScreen(),
        DoctorDashboard.id :(context)=>DoctorDashboard(),
        CreateProfile.id:(context)=>CreateProfile(),
        DoctorLogin.id:(context)=>DoctorLogin(),
        DoctorViewProfile.id:(context)=>DoctorViewProfile(),
        
      },
      
    );
  }
}