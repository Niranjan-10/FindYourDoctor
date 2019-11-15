import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyd/screens/login_user.dart';
import 'package:fyd/constants.dart';
import 'package:fyd/services/user_table.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';



class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String rePassword;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {

                return MaterialApp(
                  home: Scaffold(
                    body: ModalProgressHUD(
                      inAsyncCall: showSpinner,
                      child: Center(
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
                                  color: Colors.blueAccent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 10.0),
                                  child: Column(
                                    children: <Widget>[
                                      TextField(
                                      cursorColor: Colors.blueAccent,
                                      keyboardType: TextInputType.emailAddress,
                                      textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        email = value;
                                        print(email);
                                      },
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                    decoration: kInputDecoration.copyWith(
                                        hintText: 'Email',
                                        prefixIcon:Icon(
                                          FontAwesomeIcons.at,
                                          size: 20.0,
                                          color: Colors.blueAccent,
                                          ) ,
                                          hintStyle: TextStyle(
                                          color: Colors.blueAccent,
                                           fontFamily: 'Cabin',
                                          fontWeight: FontWeight.bold,
                                        ),
                                          ),
                                  ),
                                SizedBox(
                                      height: 10.0,
                                    ),
                                  TextField(
                                    cursorColor: Colors.blueAccent,
                                      keyboardType: TextInputType.visiblePassword,
                                      textAlign: TextAlign.center,
                                      obscureText: true,
                                      onChanged: (value) {
                                        password = value;
                                        print(password);
                                      },
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                      decoration:kInputDecoration.copyWith(
                                        hintText: 'Password',
                                        prefixIcon: Icon(
                                          FontAwesomeIcons.key,
                                          size: 20.0,
                                          color: Colors.blueAccent,
                                        ),
                                        hintStyle: TextStyle(
                                          color: Colors.blueAccent,
                                          // fontFamily: 'Raleway',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),           
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextField(
                                    cursorColor: Colors.blueAccent,
                                      keyboardType: TextInputType.visiblePassword,
                                      textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        rePassword = value;
                                        print(rePassword);
                                      },
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                      decoration:kInputDecoration.copyWith(
                                        hintText: 'Re-Password',
                                        prefixIcon: Icon(
                                          FontAwesomeIcons.key,
                                          size: 20.0,
                                          color: Colors.blueAccent,
                                        ),
                                        hintStyle: TextStyle(
                                          color: Colors.blueAccent,
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
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
              onPressed: () async {
                // Navigator.push(context, 
                // MaterialPageRoute(builder: (BuildContext context) => Departments()));
                setState(() {
                 showSpinner = true; 
                });
                try{
                  // final newUser =
                 await _auth.createUserWithEmailAndPassword(email: email,password: password).then((user){
                      print(user);
                       UserRegistration().storeNewUser(user,context);
                  
                }).catchError((e){
                  print(e);
                });
                // if(newUser != null){
                //     Navigator.pushNamed(context, departmentId);
                // }
                setState(() {
                 showSpinner = false; 
                });
              }
              catch(e){
                  print(e);
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
                  color: Colors.blueAccent
                 ),
              ),

             FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, LoginUser.id);
              },
              child: Text(
                'Login Here',
                style: TextStyle(
                  backgroundColor: Colors.white10,
                  color: Colors.blueAccent
                ),
              ),
            )

            ],),
          )
          
         
       ],    
          ),
          ),
                    ),
      )
    );
  }
}