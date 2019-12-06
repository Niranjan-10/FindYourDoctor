import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyd/constants.dart';
import 'package:fyd/services/doctor_table.dart';

class DetailView extends StatefulWidget {
  DocumentSnapshot detail;
  DetailView(this.detail);
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  DoctorCrudOperation object;
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      );
        return MaterialApp(
          home: Scaffold(
            backgroundColor: doctorBackgroundColor,
            body: Center(
              child: Card(
                elevation: 10.0,
                child: Container(
                color: doctorForegroundColor,
                width: 300.0,
                height: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Name : ${widget.detail.data['user name']}',
                      style: textStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Contact Number : ${widget.detail.data['contact number']}',
                  style: textStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Area : ${widget.detail.data['area']}',
                  style: textStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'City : ${widget.detail.data['city']}',
                  style: textStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Date : ${widget.detail.data['time'].toString().substring(0,10)}',
                  style: textStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                child: Text(
                  'Accepted',
                  style: TextStyle(
                    color:doctorBackgroundColor 
                  ),
                  ),
                disabledColor: Colors.white,
                color: Colors.white,
                  onPressed: () async {
                    print(widget.detail.data['location']['geopoint'].latitude);
                    Map<String,dynamic> data = {
                  'user name': widget.detail.data['user name'],
                  'contact number':widget.detail.data['contact number'],
                  'area':widget.detail.data['area'],
                  'city':widget.detail.data['city'],
                  'location':widget.detail.data['location']['geopoint'],
                  'status':'accepted',
                  'user id':widget.detail.data['user id'],
                  'doctor id':widget.detail.data['doctor id'],
                  'date':widget.detail.data['date'],
                  'time':widget.detail.data['time']
                 };
                 print(widget.detail.documentID);
                 Firestore.instance.collection('request_appointments').document(widget.detail.documentID).updateData({'status': 'accepted'});
                 print('succcess');
                 Firestore.instance.collection('accepted_appointments').add(data).catchError((e){
      print((e));
    });
                Navigator.pop(context);
                Navigator.pop(context);
                  },
            
                )
              ],
            ),
      ),
          ),
        ),
      ),
          
    );
  }
}