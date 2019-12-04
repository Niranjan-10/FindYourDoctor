import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyd/screens/doctors_location_screen.dart';
import 'package:fyd/services/user_table.dart';
import 'package:fyd/screens/user_RequestAppointmentsView_screen.dart';



class Departments extends StatefulWidget {
  static String id = 'departments_screen';
  @override
  _DepartmentsState createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Text('Drawer Header'),
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
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RequestAppointmentView()));

              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          height: 250.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(15.0),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            CardView(buttonName: 'Dept 1',icon: FontAwesomeIcons.addressCard,onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (BuildContext context)=> Location()
              )
              );
            },),
            CardView(buttonName: 'Dept 2',icon: FontAwesomeIcons.adjust),
            CardView(buttonName: 'Dept 3',icon: FontAwesomeIcons.adversal),
            CardView(buttonName: 'Dept 4',icon: FontAwesomeIcons.alignJustify),
            CardView(buttonName: 'Dept 5',icon: FontAwesomeIcons.amazon),
            CardView(buttonName: 'Dept 6',icon: FontAwesomeIcons.ambulance),
          ],
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