import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:fyd/screens/departments_screen.dart';
import 'package:fyd/screens/doctor_CreateProfile_screen.dart';
String documentId;
class DoctorRegistration{
    storeNewUser(doctor,context){
      print(doctor.email);
        Firestore.instance.collection('/doctors').add({
        'email':doctor.email,
        // 'password':user.password,
        'uid':doctor.uid
        // 'user':user.uid
      }).then((value){
         Navigator.pushNamed(context, CreateProfile.id);
        print(value);
      }).catchError((e){
        print(e);
      });
  
    }
}

class DoctorCrudOperation{
  
  Future<void> addDoctorProfile(dprofile,collectionName,uid) async{
    final ref = await Firestore.instance.collection(collectionName).document(uid+'@doc').setData(dprofile).catchError((e){
      print(e);
    });
    // add(dprofile).catchError((e){
    //   print(e);
    // });
    // print('your document id  is ${ref.documentID}');
    // documentId = ref.documentID;
  }

  getName(dId,collectionName)async{
     await Firestore.instance.collection(collectionName).document(dId).get().then((result){
       String name = result['name'];
       return name;
     }).catchError((e){
       print(e);
     });
     
  }
  getData(uid)async{
   await Firestore.instance.collection('departments').getDocuments();
   
  }

  Future<void> addDepartments(department, uid) async{
    final CollectionReference postsRef = Firestore.instance.collection('/departments');
    // await Firestore.instance.collection('departments').add(department).catchError((e){
    //   print(e);
    // });
    await postsRef.document(uid+'@department').setData(department);
  }

  // getDepartmentName(uid) async{
  //   await Firestore.instance.collection('/departments').document(uid+'@department').get().then((result)async{
  //     print(result['department_name']);
  //     var data =await Firestore.instance.collection(result['department_name']).document(uid+'@doc').get();
  //     print(data['name']);
  //   });
    

  // }

}
