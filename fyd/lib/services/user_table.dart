import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:fyd/screens/departments_screen.dart';

class UserRegistration{
    storeNewUser(user,context){
      print(user.email);
        Firestore.instance.collection('/users').add({
        'email':user.email,
        // 'password':user.password,
        'uid':user.uid
        // 'user':user.uid
      }).then((value){
         Navigator.pushNamed(context, Departments.id);
        print(value);
      }).catchError((e){
        print(e);
      });
  
    }
}

class UserRequests{
  userAppointmentRequest(uid,docid,data){
    final ref = Firestore.instance.collection('request_appointments').add(data).catchError((e){
      print((e));
    });
    print('success');
  }

  getRequests()async{

  }
}