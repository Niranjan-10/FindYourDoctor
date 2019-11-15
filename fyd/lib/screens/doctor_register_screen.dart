import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyd/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fyd/services/doctor_table.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyd/services/doctor_table.dart';
import 'package:fyd/screens/doctor_login_screen.dart';


class RegisterDoctor extends StatefulWidget {
static String id = 'register_doctor';

  @override
  _RegisterDoctorState createState() => _RegisterDoctorState();
}


class _RegisterDoctorState extends State<RegisterDoctor> {

  String demail;
  String dpassword;
  String drepassword;
  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false ,
        backgroundColor: Color(0xFFF1908C),
        body:  Center(          
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[                                
                                   Container(
                                  width:300.0, 
                                  margin: EdgeInsets.all(20.0),
                                  padding:EdgeInsets.all(15.0),
                                  height: 370.0,               
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Color(0xFFF5BCBA),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 10.0),
                                    child: Column(
                                      children: <Widget>[
                                        TextField(
                                        cursorColor: Color(0xFFF1908C),
                                        keyboardType: TextInputType.emailAddress,
                                        textAlign: TextAlign.center,
                                        onChanged: (value) {
                                         demail = value;
                                         print(demail);
                                        },
                                        style: TextStyle(
                                          color: Color(0xFFF1908C),
                                        ),
                                      decoration: kInputDecoration.copyWith(
                                          hintText: 'Email',
                                          prefixIcon:Icon(
                                            FontAwesomeIcons.at,
                                            size: 20.0,
                                            color:Color(0xFFF1908C),
                                            ) ,
                                            hintStyle: TextStyle(
                                            color: Color(0xFFF1908C),
                                             fontFamily: 'Cabin',
                                            fontWeight: FontWeight.bold,
                                          ),
                                            ),
                                    ),
                                  SizedBox(
                                        height: 10.0,
                                      ),
                                    TextField(
                                      cursorColor: Color(0xFFF1908C),
                                        keyboardType: TextInputType.visiblePassword,
                                        textAlign: TextAlign.center,
                                        obscureText: true,
                                        onChanged: (value) {
                                          dpassword = value;
                                          print(dpassword);
                                        },
                                        style: TextStyle(
                                          color: Color(0xFFF1908C),
                                        ),
                                        decoration:kInputDecoration.copyWith(
                                          hintText: 'Password',
                                          prefixIcon: Icon(
                                            FontAwesomeIcons.key,
                                            size: 20.0,
                                            color: Color(0xFFF1908C),
                                          ),
                                          hintStyle: TextStyle(
                                            color: Color(0xFFF1908C),
                                            // fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),           
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextField(
                                      cursorColor: Color(0xFFF1908C),
                                        keyboardType: TextInputType.visiblePassword,
                                        textAlign: TextAlign.center,
                                        onChanged: (value) {
                                          drepassword = value;
                                          print(drepassword);
                                        },
                                        style: TextStyle(
                                          color:Color(0xFFF1908C),
                                        ),
                                        decoration:kInputDecoration.copyWith(
                                          hintText: 'Re-Password',
                                          prefixIcon: Icon(
                                            FontAwesomeIcons.key,
                                            size: 20.0,
                                            color: Color(0xFFF1908C),
                                          ),
                                          hintStyle: TextStyle(
                                            color: Color(0xFFF1908C),
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            'OR',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold

                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                            Expanded(
                            child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundColor: Colors.white,                     
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                    child: IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.facebookF,
                                        size: 35.0,
                                        color: Color(0xFFF1908C),
                                      ),
                                      onPressed: (){

                                      },
                                    ),
                                  ),
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),

                            Expanded(
                            child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundColor: Colors.white,                     
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                    child: IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.google,
                                        size: 35.0,
                                        color: Color(0xFFF1908C),
                                      ),
                                      onPressed: (){

                                      },
                                    ),
                                  ),
                              ),
                            )

                          ],)
                          
                        ],
                      ),
                  ),
                  
                ),
                                
            Material(
              elevation: 5.0,
              color: Color(0xFFF5BCBA),
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
              onPressed: () async {
                if(dpassword == drepassword){
                  try{
                   await _auth.createUserWithEmailAndPassword(email: demail,password: dpassword).then((doctor){
                      print(doctor);
                       DoctorRegistration().storeNewUser(doctor,context);
                  
                }).catchError((e){
                  print(e);
                });
                  }catch(e){
                    print(e);
                  }
                }else{
                  print('Error');
                }
              },
              minWidth: 200.0,
              height: 42.0,
            child: Text(
              'Register',
            
            style: TextStyle(color: Colors.white,
            fontFamily: 'Cabin'),
          ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
             Text(
                'Already have an account?',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                 ),
              ),

             FlatButton(
              onPressed: (){
               Navigator.pushNamed(context, DoctorLogin.id);
              },
              child: Text(
                'Login Here',
                style: TextStyle(
                  backgroundColor: Color(0xFFF1908C),
                  color: Colors.white
                ),
              ),
            )

            ],),
          )
          
         
       ],    
          ),
          ),

      ),
    );
  }
}