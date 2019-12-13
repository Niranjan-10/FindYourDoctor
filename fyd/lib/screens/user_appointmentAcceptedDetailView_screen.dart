import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyd/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fyd/screens/user_Rattings_screen.dart';



class UserAcceptedRequestDetailView extends StatefulWidget {
  final String doctorName;
   final String workingLocation;

   UserAcceptedRequestDetailView(this.doctorName,this.workingLocation);
  @override
  _UserAcceptedRequestDetailViewState createState() => _UserAcceptedRequestDetailViewState();
}

class _UserAcceptedRequestDetailViewState extends State<UserAcceptedRequestDetailView> {


@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff192A56),
      
          body: Center(
        child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: new CircularPercentIndicator(
                  radius: 150.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: 0.8,
                  center: new Text(
                    "80.0%",
                    style:
                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white),
                  ),
                  footer: new Text(
                    "Accepted",
                    style:
                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.white),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Color(0xffF4C724),
                ),
              ),
              Text(
                'Great !! Your request accepted by the doctor',
                textAlign: TextAlign.center,
                style: TextStyle(color:Colors.white),
              ),
              
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    
                    decoration: BoxDecoration(
                      color: Color(0xffF4C724),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                     
                        Text(
                          'Dr. ${widget.doctorName} ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          
                          ),
                          
                        ),
                        Text(
                          'Working At : ${widget.workingLocation} ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                          ),
                          
                        ),

                      ],
                      ),
                  ),
                ),
              
              
            ]),
      ),
    );
  }

}