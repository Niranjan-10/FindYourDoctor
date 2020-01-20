import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyd/screens/doctor_usersRequestDetails_screen.dart';

FirebaseUser loggedInUser;
class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final _auth = FirebaseAuth.instance;

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
                  print(snapshot.data.documents[index].data['doctor id']);
                  print(loggedInUser.uid);
                  // _buildListItem(context,snapshot.data.documents[index]);
                  if (snapshot.data.documents[index].data['doctor id'] == loggedInUser.uid && snapshot.data.documents[index].data['status'] == 'pending'){
                    
                    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Card(
                       
                        child: ListTile(
                          title: Text(snapshot.data.documents[index].data['user name']),
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
     print(detail.data['user name']);
     Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailView(detail)));
   }

  
}