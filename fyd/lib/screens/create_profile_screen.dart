import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyd/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fyd/services/doctor_table.dart';
import 'package:fyd/screens/doctor_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

FirebaseUser loggedInUser;
String collectionName;

class DoctorProfile extends StatefulWidget {
  static String id = 'Doctor create profile';
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  Geoflutterfire geo = Geoflutterfire();
  final _auth = FirebaseAuth.instance;
  GeoFirePoint myLocation;
  double latitude ;
  double longitude ;

  String dropdownValue = 'Dermatology';  
  List<String> values = ['Dermatology','Dentist','three'];

  String name;
  String currentWorking;
  String area;
  String city;
  DoctorCrudOperation crudobj = DoctorCrudOperation();

  void getlocation(String area, String city) async {
    List<Placemark> placemark = await Geolocator().placemarkFromAddress("$area, $city");
    // print(placemark[0].position.latitude);  
    latitude = placemark[0].position.latitude;
    longitude = placemark[0].position.longitude;
    myLocation = geo.point(latitude: latitude,longitude: longitude);

  }

  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser();
    if(user != null){
      loggedInUser = user;
    }
    }catch(e){
      print(e);
    }  
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

 

  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          home: Scaffold(
            backgroundColor: doctorBackgroundColor,
            resizeToAvoidBottomPadding: false,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Flexible(
                    child: Container(
                    alignment: Alignment.center,
                    // color: doctorForegroundColor,
                    height: 500.0,
                    width: 300.0,
                     decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                       color: doctorForegroundColor,               
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        //  Image(
                        //    image: AssetImage('images/img.png'),
                        //  ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: ClipRRect(
                            borderRadius: new BorderRadius.circular(8.0),
                            child: Image.asset(
                              'images/img.png',
                              width: 100.0,
                              height: 100.0,
                              ),
                            
                          ),
                       ),
                         
                         TextField(
                            cursorColor: doctorForegroundColor,
                            
                            style: TextStyle(
                              color: doctorBackgroundColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center ,
                            onChanged: (value){
                              name = value;
                              print(name);
                            },                  
                            decoration: DoctorInputDecoration.copyWith(hintText: 'Name'),                                      
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                            cursorColor: doctorForegroundColor,
                            
                            style: TextStyle(
                              color: doctorBackgroundColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center ,
                            onChanged: (value){
                              currentWorking = value;
                              print(currentWorking);
                            },                  
                            decoration: DoctorInputDecoration.copyWith(hintText: 'Currently Working'),                                      
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                         Container(
                              width: 300.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)
                              
                              ),
                              child: DropdownButton(
                              value: dropdownValue,
                              icon: Icon(
                                Icons.arrow_downward,
                                color: doctorBackgroundColor 
                              
                                ),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(
                                color: doctorBackgroundColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                // backgroundColor: Colors.white
                                  
                                
                              ),
                              underline: Container(
                                decoration: BoxDecoration(
                                   color: Colors.white,
                                ),
                                height: 2,
                                width: double.infinity,
                               
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;   
                                });
                                collectionName = newValue;
                                print('collection name $collectionName');
                              },
                              items: values.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                              );
                            }).toList(),
                            
                          ),
                          ),    

                         SizedBox(
                          height: 8.0,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                  child: TextField(
                                  cursorColor: doctorForegroundColor,
                                  
                                  style: TextStyle(
                                    color: doctorBackgroundColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center ,
                                  onChanged: (value){
                                    area = value;
                                    print(area);
                                  },                  
                                  decoration: DoctorInputDecoration.copyWith(hintText: 'Area'),                                      
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: TextField(
                                  cursorColor: doctorForegroundColor,
                                  
                                  style: TextStyle(
                                    color: doctorBackgroundColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center ,
                                  onChanged: (value){
                                    city = value;
                                    print(city);
                                  },                  
                                  decoration: DoctorInputDecoration.copyWith(hintText: 'City'),                                      
                                ),
                              )
                           
                          ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Or',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                           SizedBox(
                            height: 8.0,
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: (){},
                            child: Icon(
                              FontAwesomeIcons.locationArrow,
                              color: doctorBackgroundColor,
                              ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                                        
                    ],
                  ),
            ),            
            ),
                ),
            SizedBox(
              height: 15.0,
            ),
            Material(
              elevation: 5.0,
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
              onPressed: () async {
               await getlocation(area, city);
               Map<String,dynamic> data = {
                 'name':name,
                //  'latitude':this.latitude , 
                //  'longitude':this.longitude,
                'location':myLocation.data,
                 'userid':loggedInUser.uid,
                  'area':area,
                  'city':city,
                  'workinglocation':currentWorking
                 };
                 Map<String,dynamic> department = {
                   'department_name':dropdownValue,
                   'uid':loggedInUser.uid,
                 };
              crudobj.addDepartments(department,loggedInUser.uid);
               crudobj.addDoctorProfile(data,dropdownValue,loggedInUser.uid).then((result){
                 Navigator.pushNamed(context, DoctorHomeScreen.id);
               }).catchError((e){
                 print(e);
               });
              // print()
              
              },
              minWidth: 200.0,
              height: 42.0,
            child: Text(
              'Submit',
            
            style: TextStyle(
              color: doctorBackgroundColor,
            fontFamily: 'Cabin'),
          ),
          ),
          )
         ]
        ),
        ),
      ),
    );
  }
}