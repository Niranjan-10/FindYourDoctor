import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyd/services/user_table.dart';

FirebaseUser loggedInUser;
class RequestAppointmentView extends StatefulWidget {
  @override
  _RequestAppointmentViewState createState() => _RequestAppointmentViewState();
}

class _RequestAppointmentViewState extends State<RequestAppointmentView> {
final _auth = FirebaseAuth.instance;

   Widget _buildListItem(BuildContext context,DocumentSnapshot document){
     print('*****************************');
    //  print(document.data);
  //  return ListTile(
  //    title: Text('hello'),
  //    onTap: (){},
  // );
  }
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
                  // print('-------------------$snapshot.data.documents.length');
                  // print(snapshot.data.documents[index].data);
                  // _buildListItem(context,snapshot.data.documents[index]);
                  if (snapshot.data.documents[index].data['user id'] == loggedInUser.uid){
                    print('$loggedInUser.uid');
                    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ListTile(
                          title: Text(snapshot.data.documents[index].data['user name']),
                          onTap: () {
                            print(loggedInUser.uid);
                          },
                          trailing: Text("Test2"),
                        ),
                      )
              ],
            );
                  }else{
                    print('failed...');
                  }
                  return Text('Loading.........');  
                },
              );
            },
          ),
        ),
      ),
    );
  }

}