import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyd/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fyd/screens/doctor_home_screen.dart';


class DoctorLogin extends StatefulWidget {
  static String id = 'doctor login';
  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {

  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: doctorBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
          child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.only(bottom:18.0),
                 child: Text(
                   'Login As Doctor',
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Colors.white,
                     fontFamily: 'Raleway',
                     fontSize: 20.0,
                     fontWeight: FontWeight.bold
                   ),
                 ),
               ),
               Flexible(
                            child: Container(
                            width:300.0, 
                            margin: EdgeInsets.all(20.0),
                            padding:EdgeInsets.all(15.0),
                            height: 180.0,               
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: doctorForegroundColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 10.0),
                              child: Column(
                                children: <Widget>[
                                   TextField(
                                            cursorColor: doctorBackgroundColor,
                                            keyboardType: TextInputType.emailAddress,
                                            textAlign: TextAlign.center,
                                            onChanged: (value) {
                                              email = value;
                                              print(email);
                                            },
                                            style: TextStyle(
                                              color: doctorBackgroundColor,
                                            ),
                                          decoration: kInputDecoration.copyWith( 
                                              hintText: 'Email',
                                              prefixIcon:Icon(
                                                FontAwesomeIcons.at,
                                                size: 20.0,
                                                color: doctorBackgroundColor,
                                                ) ,
                                                hintStyle: TextStyle(
                                                color: doctorBackgroundColor,
                                                 fontFamily: 'Cabin',
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                    ),

                                     SizedBox(
                                          height: 20.0,
                                        ),
                                      TextField(
                                        cursorColor: doctorBackgroundColor,
                                          keyboardType: TextInputType.visiblePassword,
                                          textAlign: TextAlign.center,
                                          obscureText: true,
                                          onChanged: (value) {
                                            password = value;
                                            print(password);
                                          },
                                          style: TextStyle(
                                            color: doctorBackgroundColor,
                                          ),
                                          decoration:kInputDecoration.copyWith(
                                            hintText: 'Password',
                                            prefixIcon: Icon(
                                              FontAwesomeIcons.key,
                                              size: 20.0,
                                              color: doctorBackgroundColor,
                                            ),
                                            hintStyle: TextStyle(
                                              color: doctorBackgroundColor,
                                              // fontFamily: 'Raleway',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),           
                                       ),

                                ],
                                ),
                            ),
                 ),
               ),
                Material(
                elevation: 5.0,
                color: doctorBackgroundColor,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                onPressed: () async {
                  setState(() {
                 showSpinner = true; 
                  });
                  try{
                    final user = await _auth.signInWithEmailAndPassword(email: email,password: password);
                    if(user != null){
                      Navigator.pushNamed(context, DoctorHomeScreen.id);
                    }
                    setState(() {
                     showSpinner = false; 
                    });
                  }catch(e){
                    print(e);
                  }
                  
                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                'Login',           
              style: TextStyle(color: Colors.white,
              fontFamily: 'Cabin'),
            ),
            ),
            ),
             ],
        ),
    ),
      )
    );
  }
}