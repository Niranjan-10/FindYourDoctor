import 'package:flutter/material.dart';
import 'package:fyd/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
   DateTime dateTime = DateTime.now();
  String doctorId ;
  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: 'Initial value');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width:300.0, 
            margin: EdgeInsets.all(20.0),
            padding:EdgeInsets.all(15.0),
            height: 370.0,               
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.blueAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                          TextFormField(
                                    cursorColor: Colors.blueAccent,
                                    keyboardType: TextInputType.emailAddress,
                                    textAlign: TextAlign.center,
                                    // controller: _controller,
                                    initialValue: widget.doctorName,
                                    onChanged: (value) {
                                      
                                    },
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                    ),
                                  decoration: kInputDecoration.copyWith( 
                                    
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
                            FlatButton(
                              color: Colors.white,
                              onPressed: () {
                                  DatePicker.showDateTimePicker(context,
                                                        showTitleActions: true,
                                                        minTime: DateTime(2018, 3, 5, 12, 3 ),
                                                        maxTime: DateTime(2019, 6, 7, 12, 3), onChanged: (date) {
                                                      print('change $date');
                                                    }, onConfirm: (date) {
                                                      setState(() {
                                                        dateTime = date;
                                                        print('-------------------');
                                                        setState(() {
                                                          doctorId = widget.doctorId;
                                                          print(doctorId);
                                                        });
                                                        print(dateTime.toLocal());
                                                        
                                                      });
                                                      
                                                      print('confirm $date');
                                                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                              },
                              child: Text(
                                  '$dateTime',
                                  style: TextStyle(color: Colors.blueAccent),
                              ),
                              shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(32.0),
                                      side: BorderSide(color: Colors.white,width: 2.0)
                                ),
                            padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
                              
                              )
              ],
            ),

          ),
        ),
      ),
    );
  }
}