import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyd/constants.dart';
import 'package:fyd/components/doctor_profile_widget.dart';
import 'package:fyd/screens/create_profile_screen.dart';


class CreateProfile extends StatefulWidget {
  static String id = 'create profile';
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  @override
  Widget build(BuildContext context) {
          
                return MaterialApp(
                  home: Scaffold(
                      backgroundColor:doctorBackgroundColor,
                      body: Center(
                        child: new DoctorProfileWidget(text: 'Create Profile',onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorProfile()));
                        },),
                      ),
        ),
    );
  }
}

