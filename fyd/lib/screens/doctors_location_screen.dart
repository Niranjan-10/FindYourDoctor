import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyd/screens/user_appointmentrequest_screen.dart';
// import 'dart:async';


double lat ;
double long;
   
class Location extends StatefulWidget {
  String department_name;
  Location(this.department_name);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
bool showSpinner = false;
bool mapToggle = false;
bool doctorToggle = false;
var currentLocation;
GoogleMapController mapController;
Set<Marker> _markers = {};
var doctors = [];
String doctorId; 
String doctorName;


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((currloc){
      setState((){
        currentLocation = currloc;
        mapToggle = true;
        lat = currentLocation.latitude;
        long = currentLocation.longitude;
        // initMarker();
        // addMarker();
        populateClients();
      });
    });
  }

  populateClients(){
    Firestore.instance.collection(widget.department_name).getDocuments().then((docs){
      if(docs.documents.isNotEmpty){
        setState(() {
          doctorToggle = true;
        });
        for(int i=0; i<docs.documents.length; ++i){
          // print(docs.documents[i].data['latitude'].toDouble.runtimeType);
          doctors.add(docs.documents[i].data);
          // print('.............${docs.documents[i].data['location']['geopoint'].latitude}');
          initmarkers(docs.documents[i].data);
          // initMarker(docs.documents[i].data);
        }
      }
    });
   
  }




  initmarkers(doctors){
    double latitude = doctors['location']['geopoint'].latitude;
    double longitude = doctors['location']['geopoint'].longitude;
     setState(() {
  
     _markers.add(
       Marker(
          markerId: MarkerId(LatLng(latitude,longitude).toString()),
          position:LatLng(latitude,longitude),
          infoWindow: InfoWindow(
          title: doctors['name'],
          snippet: '5 Star Rating',
     )
       )
     );
     });
  }
  
  Widget doctorCard(doctor){
    setState(() {
      doctorId = doctor['userid'];
      doctorName = doctor['name'];
    });
      return Padding(
        padding: EdgeInsets.only(left: 2.0, top: 10.0),
        child: InkWell(
          onTap:(){
            setState(() {
              zoomInMarker(doctor);
            });
          },
          
            // onTap: () {
            //   setState(() {
            //     currentClient = doctor;
            //     currentBearing = 90.0;
            //   });
              
            // },
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                    height: 100.0,
                    width: 125.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            doctor['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          SizedBox(height: 10.0,),

                          SizedBox(
                          width: 80.0,
                          height: 30.0,
                          child: RaisedButton(
                            // disabledColor: Colors.white,
                            // elevation: 2.0,
                            color: Colors.blueAccent,
                            onPressed: () {
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>RequestAppointment(doctorId, doctorName)));
                            },
                            child:Text(
                              'Request',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.0
                              ),
                              ),
                              
                            shape:  RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(6.0),
                                    // side: BorderSide(color: Colors.white)
                              ),
                          ),
                        )
                        ],
                      )
                      )),
              ),
            )));
  }

  zoomInMarker(doctor){
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(doctor['location']['geopoint'].latitude,doctor['location']['geopoint'].longitude),
        zoom: 17.0,
        bearing: 90.0,
        tilt: 45.0
      )
      ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.blueAccent,),
      body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height ,
                  width: double.infinity,
                  child: mapToggle ? 
                  GoogleMap(
                    onMapCreated:onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(currentLocation.latitude,currentLocation.longitude),
                      zoom: 12.0,
                      ),
                      markers: _markers,  

                      )
                  
                  :
                  Center(
                    child: Text(
                      'Loading .....Please wait...',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ) ,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height - 150.0,
                    left: 10.0,
                    child: Container(
                      height: 125.0,
                      width: MediaQuery.of(context).size.width,
                      child: doctorToggle?
                      ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(8.0),
                        children: doctors.map((element){
                          return doctorCard(element);
                        }).toList(),
                      ):Container(
                        height: 1.0,
                        width:1.0
                      ),


                    ),
                  )
                  
              ],
            ),
        ],
        ),
      ),

    );    
  }
  void onMapCreated(controller){
    setState(() {
     mapController = controller; 
    });

  }

 
}