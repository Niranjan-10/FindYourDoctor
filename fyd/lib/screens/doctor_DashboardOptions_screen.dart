import 'package:flutter/material.dart';
import 'package:fyd/screens/doctor_dashboardView_screen.dart';
import 'package:fyd/screens/doctor_AcceptedAppointments_screen.dart';
import 'package:fyd/screens/doctor_visitedAppointments_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyd/constants.dart';


class DashboardOptionsView extends StatefulWidget {
  @override
  _DashboardOptionsViewState createState() => _DashboardOptionsViewState();
}

class _DashboardOptionsViewState extends State<DashboardOptionsView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: doctorBackgroundColor,
        body: Center(
        child: Container(
          height: 140.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: doctorForegroundColor,
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(15.0),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 3,
          children: <Widget>[
            CardView(buttonName: 'Requests',icon: FontAwesomeIcons.addressCard,onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (BuildContext context)=> DashboardView()
              )
              );
            },),
            CardView(buttonName: 'Accepted',icon: FontAwesomeIcons.adjust,onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (BuildContext context)=> DoctorAcceptedAppointmentsView()));
            },),
            CardView(buttonName: 'Visited',icon: FontAwesomeIcons.adversal, onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> DoctorVisitedView()));
            },),
          ],
          ),

        ),
      ),
        ),
      );
  }
}

class CardView extends StatelessWidget {

CardView({this.icon,this.buttonName,this.onPressed});
final String buttonName;
final IconData icon;
final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      ),
        child: Container(
        padding: const EdgeInsets.all(8),
        
        decoration: BoxDecoration(
            color: doctorBackgroundColor,
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
          IconButton(
            icon: Icon(icon),
            color: Colors.white,
            iconSize: 30.0,
            onPressed: onPressed,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            buttonName,
            style: TextStyle(
              // fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          )
        ],),
        
      ),
    );
  }
}