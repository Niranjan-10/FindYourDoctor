import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRattings extends StatefulWidget {
  final String doctorName;
  final String userId;
  final String doctorId;
  UserRattings(this.doctorName,this.doctorId,this.userId);
  @override
  _UserRattingsState createState() => _UserRattingsState();
}

class _UserRattingsState extends State<UserRattings> {
  var rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                   Container(
              height: 300.0,
              width: 300.0,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                     Text(
                      'Thank You',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent
                      ),
                     ),
                      SizedBox(height: 10.0,),
                      Text(
                      'Hope you like our service, please give ratings',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.blueAccent
                      ),
                      
                      ),
                    SizedBox(height: 10.0,),
                    SmoothStarRating(
                        rating: rating,
                        size: 45,
                        starCount: 5,
                        spacing: 2.0,
                        onRatingChanged: (value) {
                          setState(() {
                            rating = value;
                          });
                        },
                      ),
                      SizedBox(height: 10.0,),

                ],
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ButtonTheme(
                  minWidth: 180.0,
                  child: RaisedButton(
                    onPressed: ()async{
                      Map<String,dynamic> data ={
                        'user id' :widget.userId,
                        'doctor id':widget.doctorId,
                        'doctor name':widget.doctorName,
                        'rating':rating
                      };
                      await Firestore.instance.collection('ratings').add(data).catchError((e)=>print(e));
                      Navigator.pop(context);
                       Navigator.pop(context);
                        Navigator.pop(context);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.blueAccent
                      ),
                      ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),                         
                              ),
                  ),
                ),
              )
                
            ]
          ),
        ),
      )
    );
  }
}