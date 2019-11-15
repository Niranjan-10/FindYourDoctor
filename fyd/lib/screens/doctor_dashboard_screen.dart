import 'package:flutter/material.dart';
import 'package:fyd/constants.dart';


class DoctorDashboard extends StatefulWidget {
  static String id = 'Doctor dashboard';
  @override
  _DoctorDashboardState createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:  doctorBackgroundColor ,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[                       
            Expanded(
                  child: Container(
                  width: 400.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: doctorForegroundColor,
                  ),
                  
                    child: ListView(
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: [
                        ListTile(
                        title: Text('Sun'),
                        
                      ),
                      ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ),
                       ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ), ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ), ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ), ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ),
                      ]
                    ).toList()      
                ),
              ),
            ),
             SizedBox(
                height: 15.0,
              ),
            
            Expanded(
                  child: Container(
                  width: 400.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: doctorForegroundColor,
                  ),
                  
                    child: ListView(
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: [
                        ListTile(
                        title: Text('Sun'),
                        
                      ),
                      ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ),
                       ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ), ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ), ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ), ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ),
                      ]
                    ).toList()      
                ),
              ),
            ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                  child: Container(
                  width: 400.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: doctorForegroundColor,
                  ),
                  
                    child: ListView(
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: [
                        ListTile(
                        title: Text('Sun'),
                        
                      ),
                      ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ),
                       ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ), ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ), ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ), ListTile(
                        title: Text('Moon'),
                      ),
                      ListTile(
                        title: Text('Star'),
                      ),
                      ]
                    ).toList()      
                ),
              ),
            ),
            

              ]
              ),
          ),
        ),
      ),
    );
  }
}