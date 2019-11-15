import 'package:flutter/material.dart';
import 'package:fyd/constants.dart';


class DoctorProfileWidget extends StatelessWidget {
  DoctorProfileWidget({this.text,this.onPressed,this.btn});

  final String text ;
  final Function onPressed;
  final String btn;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
     
       width: 300.0,
       height: 100.0,
       decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
           color: doctorForegroundColor,
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
               ),
               SizedBox(
                 width: 30.0,
               ),
               SizedBox(
                 height: 40.0,
                 width: 50.0,
                  child: FloatingActionButton(
                  heroTag:btn ,
                   onPressed: onPressed,                                       
                   backgroundColor: Colors.white,
                   child: Icon(
                     Icons.add,
                     color: doctorBackgroundColor,
                   ),
                   
                 ),
               )
                ],                       
        ),
              );
  }
}