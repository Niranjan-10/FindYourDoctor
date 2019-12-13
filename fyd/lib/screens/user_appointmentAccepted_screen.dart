import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyd/screens/user_appointmentAcceptedDetailView_screen.dart';

FirebaseUser loggedInUser;

class UserAppointmentAccepted extends StatefulWidget {
  @override
  _UserAppointmentAcceptedState createState() => _UserAppointmentAcceptedState();
}

class _UserAppointmentAcceptedState extends State<UserAppointmentAccepted> {
   final _auth = FirebaseAuth.instance;
   String doctorName = 'Please Wait...';
   String workingLocation = 'Please Wait';

    void getCurrentUser() async{
    final user = await _auth.currentUser();
    if(user != null){
      loggedInUser = user;
      print(loggedInUser.uid);
    }

  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Accepted Appointments'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: Firestore.instance.collection('accepted_appointments').snapshots(),
            builder: (context,snapshot){
              if(!snapshot.hasData){
                return const Text('Loading...........');
              }
              return ListView.builder(
                itemExtent: 80.0,
                itemCount: snapshot.data.documents.length,
                // itemCount: 10,
                itemBuilder: (context,index){
                  Firestore.instance.collection('departments').document(snapshot.data.documents[index].data['doctor id']+'@department').get().then((document){
                    Firestore.instance.collection(document.data['department_name']).document(document.data['uid']+'@doc').get().then((innerData){
                      setState(() {
                         doctorName = innerData.data['name'].toString();
                         workingLocation = innerData.data['workinglocation'].toString();
                      });
                     
                    });
                    });
                  if (snapshot.data.documents[index].data['user id'] == loggedInUser.uid && snapshot.data.documents[index].data['status'] == 'accepted'){
                    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Card(
                       
                        child: ListTile(
                          title: Text(doctorName),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          selected: true,
                          onTap: () {
                              navigateToDetail(snapshot.data.documents[index]);
                          },
                          
                        ),
                      )
              ],
            );
                  }else{
                    print('failed...');
                  }
                  return Text('');  
                },
              );
            },
          ),
        ),
      ),
    );
  }
   void navigateToDetail(DocumentSnapshot detail) {
     Navigator.push(context, MaterialPageRoute(builder: (context)=> UserAcceptedRequestDetailView(doctorName,workingLocation)));
   }
  
}