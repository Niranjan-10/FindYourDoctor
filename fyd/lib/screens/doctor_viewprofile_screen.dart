import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyd/constants.dart';
import 'package:fyd/screens/doctor_home_screen.dart';
import 'package:fyd/services/doctor_table.dart';
import 'package:fyd/screens/create_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseUser loggedInUser;
class DoctorViewProfile extends StatefulWidget {
  
  static String id = 'view profile';
  @override
  _DoctorViewProfileState createState() => _DoctorViewProfileState();
}

class _DoctorViewProfileState extends State<DoctorViewProfile> {

  final _auth = FirebaseAuth.instance;
  String docId = documentId;
  DoctorCrudOperation crudobj  = new DoctorCrudOperation();
  String city = 'Loading...';
  String area = 'Loading...';
  String working = 'Loading...';
  // String name;
  String name = 'Loading...';

    void getCurrentUser() async{
    try{
      final user = await _auth.currentUser();
    if(user != null){
      loggedInUser = user;
      print(loggedInUser.uid);
      // crudobj.getDepartmentName(loggedInUser.uid);
      await Firestore.instance.collection('/departments').document(loggedInUser.uid+'@department').get().then((result)async{
      print(result['department_name']);
      var data =await Firestore.instance.collection(result['department_name']).document(loggedInUser.uid+'@doc').get();
      print(data['name']);
      print(data['workinglocation']);

      setState(() {
        name = data['name'];
        working = data['workinglocation'];
        area = data['area'];
        city = data['city'];
      });
      
    });
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
    // crudobj.getName(loggedInUser.uid);
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: doctorBackgroundColor,
          body: Center(
            child: Container(
              width: 300.0,
              height: 400.0,              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: doctorForegroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Name :',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                         Text(
                          name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        ),
                        ),

                    ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Work At :',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                         Text(
                          working,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        ),
                        ),

                    ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Area :',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                         Text(
                          area,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        ),
                        ),

                    ],
                    ),
                     SizedBox(
                      height: 10.0,
                    ),
                     Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'City :',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                         Text(
                          city,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold
                        ),
                        ),

                    ],
                    ),


                ],
              ),
            ),
          )
      ),
    );
  }
}