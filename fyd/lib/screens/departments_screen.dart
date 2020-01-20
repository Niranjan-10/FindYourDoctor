
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyd/screens/doctors_location_screen.dart';

import 'package:fyd/screens/user_RequestAppointmentsView_screen.dart';
import 'package:fyd/screens/user_appointmentAccepted_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyd/screens/user_DoctorVisited_screen.dart';



class Departments extends StatefulWidget {
  static String id = 'departments_screen';
  @override
  _DepartmentsState createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
final _auth = FirebaseAuth.instance;
String department_name;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
       
        iconTheme: IconThemeData(color: Colors.blueAccent),
        backgroundColor: Colors.white10,
        elevation: 0,
    
      ),
      drawer: Drawer(
         child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Find Your Doctor'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Appointment Requests'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RequestAppointmentView()));

              },
            ),
            ListTile(
              title: Text('Appointment Accepted'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserAppointmentAccepted()));

              },
            ),
            ListTile(
              title: Text('Doctor visited'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDoctorVisited()));

              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () async{
                Navigator.pop(context);
                Navigator.pop(context);

               await _auth.signOut();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(          
            height: 140.0,
            width: 400.0,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: GridView.count(
            
            primary: false,
            padding: const EdgeInsets.all(9.0),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
            children: <Widget>[
              CardView(
                buttonName: 'Dermatol',                         
                icon: FontAwesomeIcons.addressCard,
                onPressed: (){
                setState(() {
                  department_name = 'Dermatology';
                });
                Navigator.push(context, 
                MaterialPageRoute(builder: (BuildContext context)=> Location(department_name)
                )
                );
              },),
              CardView(
                buttonName: 'Dentist ',
              icon: FontAwesomeIcons.adjust,
              onPressed: (){
                setState(() {
                  department_name = 'Dentist';
                });
                Navigator.push(context, 
                MaterialPageRoute(builder: (BuildContext context)=> Location(department_name)
                )
                );
              },
              ),
              CardView(
                buttonName: 'Trichologi',
                icon: FontAwesomeIcons.adversal,
                onPressed: (){
                setState(() {
                  department_name = 'Dentist';
                });
                Navigator.push(context, 
                MaterialPageRoute(builder: (BuildContext context)=> Location(department_name)
                )
                );
              },
                ),
             
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
            color: Colors.blueAccent[100],
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