import 'package:flutter/material.dart';
import 'package:fyd/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:fyd/services/user_table.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


FirebaseUser loggedInUser;
class RequestAppointment extends StatefulWidget {
  static String id = 'request appointment';
  final String doctorId; 
  final String doctorName;
  RequestAppointment(this.doctorId,this.doctorName);
  @override
  _RequestAppointmentState createState() => _RequestAppointmentState();
}

class _RequestAppointmentState extends State<RequestAppointment> {

   TextEditingController _controller;
   DateTime dateTime;
   String dDate= 'Enter Date';
   String dTime = 'Time';
  

   String doctorId;
 
    String userName;  
    String area;
    String city;
    String contactNumber;

    final format = DateFormat("HH:mm");
     final dformat = DateFormat("yyyy-MM-dd");

    final _auth = FirebaseAuth.instance;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    Geoflutterfire geo = Geoflutterfire();
    GeoFirePoint myLocation;
    double latitude ;
    double longitude ;
    UserRequests object = new UserRequests();


    void getlocation(String area, String city) async {
    List<Placemark> placemark = await Geolocator().placemarkFromAddress("$area, $city");
    // print(placemark[0].position.latitude);  
    latitude = placemark[0].position.latitude;
    longitude = placemark[0].position.longitude;
    myLocation = geo.point(latitude: latitude,longitude: longitude);
  }
    

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: 'Initial value');
    getCurrentUser();
    print('----------------- doctorid');
    print(widget.doctorId);
    
  }

  void getCurrentUser() async{
    final user = await _auth.currentUser();
    if(user != null){
      loggedInUser = user;
      print(loggedInUser.uid);
      print(widget.doctorId);
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[    
            Container(
              width:300.0, 
              margin: EdgeInsets.all(20.0),
              padding:EdgeInsets.all(15.0),
              height: 400.0,               
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                            TextFormField(
                                      cursorColor: Colors.blueAccent,
                                      textAlign: TextAlign.center,
                                      // obscureText: ,
                                      // controller: _controller,
                                      // initialValue: widget.doctorName,
                                      onChanged: (value) {
                                        userName = value;
                                      },
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                    decoration: kInputDecoration.copyWith( 
                                      
                                        prefixIcon:Icon(
                                          FontAwesomeIcons.userAlt,
                                          size: 20.0,
                                          color: Colors.blueAccent,
                                          ) ,
                                          hintText: 'Your Name',
                                          hintStyle: TextStyle(
                                          color: Colors.blueAccent,
                                            fontFamily: 'Cabin',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              TextFormField(
                                      cursorColor: Colors.blueAccent,
                                      textAlign: TextAlign.center,

                                      // controller: _controller,
                                      // initialValue: widget.doctorName,
                                      onChanged: (value) {
                                        contactNumber = value;
                                      },
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                    decoration: kInputDecoration.copyWith( 
                                      
                                        prefixIcon:Icon(
                                          FontAwesomeIcons.phoneAlt,
                                          size: 20.0,
                                          color: Colors.blueAccent,
                                          ) ,
                                          hintText: 'Contact Number',
                                          hintStyle: TextStyle(
                                          color: Colors.blueAccent,
                                            fontFamily: 'Cabin',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                                 TextFormField(
                                        cursorColor: Colors.blueAccent,
                                        // keyboardType: TextInputType.emailAddress,
                                        textAlign: TextAlign.center,
                                        onChanged: (value) {
                                          area = value;
                                        },
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                        ),
                                      decoration: kInputDecoration.copyWith( 
                                        
                                          prefixIcon:Icon(
                                            FontAwesomeIcons.chartArea,
                                            size: 20.0,
                                            color: Colors.blueAccent,
                                            ) ,
                                            hintText: 'Area',
                                            hintStyle: TextStyle(
                                            color: Colors.blueAccent,
                                              fontFamily: 'Cabin',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                ),
                              
                              SizedBox(
                                height: 5.0,
                              ),
                              TextFormField(
                                      cursorColor: Colors.blueAccent,
                                      // keyboardType: TextInputType.emailAddress,
                                      textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        city = value;
                                      },
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      ),
                                    decoration: kInputDecoration.copyWith( 
                                      
                                        prefixIcon:Icon(
                                          FontAwesomeIcons.city,
                                          size: 20.0,
                                          color: Colors.blueAccent,
                                          ) ,
                                          hintText: 'City',
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
                              
                              DateTimeField(
                                    format: format,
                                  
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      // fontWeight: FontWeight.bold

                                      ),
                                    decoration: kInputDecoration.copyWith( 
                                        prefixIcon:Icon(
                                          FontAwesomeIcons.solidClock,
                                          size: 20.0,
                                          color: Colors.blueAccent,
                                          ) ,
                                          
                                          hintText: 'Time',
                                          hintStyle: TextStyle(
                                          color: Colors.blueAccent,
                                          fontFamily: 'Cabin',
                                          fontWeight: FontWeight.bold,
                                          
                                        ),
                                  ),
                                    onShowPicker: (context, currentValue) async {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                      );
                                      dTime = time.toString();
                                      print(dTime);
                                      setState(() {
                                        doctorId = widget.doctorId;
                                      });
                                      return DateTimeField.convert(time);
                                    },
                                  ),
                              SizedBox(
                                height: 10.0,
                              ),
                              DateTimeField(
                                  format: dformat,
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      // fontWeight: FontWeight.bold

                                      ),
                                    decoration: kInputDecoration.copyWith( 
                                        prefixIcon:Icon(
                                          FontAwesomeIcons.solidClock,
                                          size: 20.0,
                                          color: Colors.blueAccent,
                                          ) ,
                                          
                                          hintText: 'Date',
                                          hintStyle: TextStyle(
                                          color: Colors.blueAccent,
                                          fontFamily: 'Cabin',
                                          fontWeight: FontWeight.bold,
                                          
                                        ),
                                  ),
                                  onShowPicker: (context, currentValue) async {
                                    final date = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate: currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2100));
                                    if (date != null) {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime:
                                            TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                      );
                                      dDate = date.toString();
                                      return DateTimeField.combine(date, time);
                                    } else {
                                      return currentValue;
                                    }
                                  },
                                ),
                              
                ],
              ),

            ),

            Material(
              elevation: 5.0,
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
              onPressed: () async {
               
                 await getlocation(area, city);
                 Map<String,dynamic> data = {
                  'user name': userName,
                  'contact number':contactNumber,
                  'area':area,
                  'city':city,
                  'location':myLocation.data,
                  'status':'pending',
                  'user id':loggedInUser.uid,
                  'doctor id':doctorId,
                  'date':dDate,
                  'time':dTime,
                 };
                 object.userAppointmentRequest(loggedInUser.uid, doctorId, data);
                  _onAlertButtonPressed(context);
              },
              minWidth: 200.0,
              height: 42.0,
            child: Text(
              'Request Appointment',
            
            style: TextStyle(color: Colors.white,
            fontFamily: 'Cabin'),
          ),
          ),
          ),
            ],
          ),
        ),
      ),
    );
  }

    _onAlertButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Appointment Submitted",
      desc: "Check the status of your request",
      buttons: [
        DialogButton(
          child: Text(
            "Home",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          width: 120,
          onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
          } 
          
        )
      ],
    ).show();
  }
}