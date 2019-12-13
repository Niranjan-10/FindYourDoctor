import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyd/constants.dart';
import 'package:fyd/screens/user_DoctorVisited_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fyd/screens/user_Rattings_screen.dart';


class UserDoctorVisitedDetailView extends StatefulWidget {
  final String doctorName;
   final String workingLocation;
   final String doctorID;
   final String userId;
   UserDoctorVisitedDetailView(this.doctorName,this.workingLocation,this.doctorID,this.userId);
  @override
  _UserDoctorVisitedDetailViewState createState() => _UserDoctorVisitedDetailViewState();
}

class _UserDoctorVisitedDetailViewState extends State<UserDoctorVisitedDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      
          body: Center(
        child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: new CircularPercentIndicator(
                  radius: 150.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: 1.0,
                  center: new Text(
                    "100%",
                    style:
                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white),
                  ),
                  footer: new Text(
                    "Visited",
                    style:
                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.white),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Color(0xffF4C724),
                ),
              ),
              Text(
                'Yahooo!! You get the service from doctor',
                textAlign: TextAlign.center,
                style: TextStyle(color:Colors.white),
              ),
              
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    width: double.infinity,
                    height: 130.0,
                    
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                     
                        Text(
                          'Dr. ${widget.doctorName} ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          
                          ),
                          
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Working At : ${widget.workingLocation} ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                          ),
                          
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        RaisedButton(
                          color: Color(0xffF4C724),
                          elevation: 5.0,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> UserRattings(widget.doctorName,widget.doctorID,widget.userId)));
                          },
                          child: Text('Give Ratings',style: TextStyle(color: Colors.white),),
                          shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                         
                          ),
                        )

                      ],
                      ),
                  ),
                ),
              
              
            ]),
      ),
    );
  }
}
