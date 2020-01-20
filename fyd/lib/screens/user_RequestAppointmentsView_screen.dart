import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseUser loggedInUser;
class RequestAppointmentView extends StatefulWidget {
  @override
  _RequestAppointmentViewState createState() => _RequestAppointmentViewState();
}

class _RequestAppointmentViewState extends State<RequestAppointmentView> {
final _auth = FirebaseAuth.instance;
  String doctorName = 'Please Wait...';
   String workingLocation = 'Please Wait';

  //  Widget _buildListItem(BuildContext context,DocumentSnapshot document){
  //    print('*****************************');
  //   //  print(document.data);
  // //  return ListTile(
  // //    title: Text('hello'),
  // //    onTap: (){},
  // // );
  // }
    void getCurrentUser() async{
    final user = await _auth.currentUser();
    if(user != null){
      loggedInUser = user;
      print(loggedInUser.uid);
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
        appBar: AppBar(
          title: Text('Requests'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: Firestore.instance.collection('request_appointments').snapshots(),
            builder: (context,snapshot){
              if(!snapshot.hasData){
                return const Text('Loading...........');
              }
              return ListView.builder(
                itemExtent: 80.0,
                itemCount: snapshot.data.documents.length,
                // itemCount: 10,
                itemBuilder: (context,index){
                  print('----------------------------------------');
                  print(snapshot.data.documents[index].data['doctor id']);
                  // _buildListItem(context,snapshot.data.documents[index]);
                   Firestore.instance.collection('departments').document(snapshot.data.documents[index].data['doctor id']+'@department').get().then((document){
                    Firestore.instance.collection(document.data['department_name']).document(document.data['uid']+'@doc').get().then((innerData){
                    //  print('----------------------${innerData.data}');
                      setState(() {
                         doctorName = innerData.data['name'].toString();
                         workingLocation = innerData.data['workinglocation'].toString();
                      });
                     
                    });
                    });

                  if (snapshot.data.documents[index].data['user id'] == loggedInUser.uid && snapshot.data.documents[index].data['status'] == 'pending'){
                    print('$loggedInUser.uid');
                    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      
                        Card(
                            child: ListTile(
                            title: Text(doctorName),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              print(loggedInUser.uid);
                            },
                            
                          ),
                        ),
                      
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

}