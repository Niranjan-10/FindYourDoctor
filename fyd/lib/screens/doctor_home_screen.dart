import 'package:flutter/material.dart';
import 'package:fyd/constants.dart';
import 'package:fyd/components/doctor_profile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fyd/screens/doctor_viewprofile_screen.dart';
import 'package:fyd/screens/doctor_DashboardOptions_screen.dart';

FirebaseUser loggedInUser;
class DoctorHomeScreen extends StatefulWidget {
  static String id = 'Doctor home screen'; 
  @override
  _DoctorHomeScreenState createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  final _auth = FirebaseAuth.instance;
  


  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser();
    if(user != null){
      loggedInUser = user;
      print(loggedInUser.uid);

    }
    }catch(e){
      print(e);
    }  
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: doctorBackgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DoctorProfileWidget(text:'Your Profile',onPressed: (){
                  Navigator.pushNamed(context, DoctorViewProfile.id);
                },btn: 'btn1',),
                SizedBox(
                  height: 20.0,
                ),
                DoctorProfileWidget(text:'Dashboard',onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardOptionsView()));
                },btn: 'btn2',)
              ],
            ),
          ),
        ),
    );
  }
}