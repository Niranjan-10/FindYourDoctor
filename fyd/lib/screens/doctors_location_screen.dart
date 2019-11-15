import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:async';


double lat ;
double long;
   
class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
bool showSpinner = false;
bool mapToggle = false;
var currentLocation;
GoogleMapController mapController;
Set<Marker> _markers = {};
var doctors = [];


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
    Firestore.instance.collection('Dermatology').getDocuments().then((docs){
      if(docs.documents.isNotEmpty){
        for(int i=0; i<docs.documents.length; ++i){
          // print(docs.documents[i].data['latitude'].toDouble.runtimeType);
          // doctors.add(docs.documents[i].data);
          print('.............${docs.documents[i].data['location']['geopoint'].latitude}');
          initmarkers(docs.documents[i].data);
          // initMarker(docs.documents[i].data);
        }
      }
    });
    // print('doctors.............$doctors');
  }

  // initMarker(){
  //   for(int i =0; i<2; i++){
  //     if(i==1){
  //       print(i);
  //           setState(() {
  //        _markers.add(
  //    Marker(
  //         markerId: MarkerId(currentLocation.toString()),
  //         position:LatLng(34.0522,-118.2437),
  //         infoWindow: InfoWindow(
  //         title: 'Really cool place',
  //         snippet: '4 Star Rating',
  //    ),
  //    icon: BitmapDescriptor.defaultMarker,
  //    )
  //  );
    
  // });
  // }
  // else{
  //         setState(() {
  //        _markers.add(
  //    Marker(
  //         markerId: MarkerId(LatLng(40.7128,-74.0060).toString()),
  //         position:LatLng(40.7128,-74.0060),
  //         infoWindow: InfoWindow(
  //         title: 'Really cool place',
  //         snippet: '3 Star Rating',
  //    ),
  //    icon: BitmapDescriptor.defaultMarker
  //    )
  //  );
    
  // });

  // }

  // }
  // print('markers are..........$_markers');
  // }

  // addMarker(){
  //     _markers.add(
  //       Marker(
  //         markerId: MarkerId(LatLng(lat,long).toString()),
  //         position:LatLng(lat,long),
  //         infoWindow: InfoWindow(
  //         title: 'Really cool place',
  //         snippet: '5 Star Rating',
  //     ),
  //     icon: BitmapDescriptor.defaultMarker,
  //       )
  //     );
  //   }

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