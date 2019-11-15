import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyd/screens/register_screen.dart';
import 'package:fyd/screens/doctor_register_screen.dart';



class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconContainer(icon: FontAwesomeIcons.userAlt,onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>
                    RegisterUser()
                  ));
                },),
                IconContainer(icon: FontAwesomeIcons.userMd,onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>RegisterDoctor()));
                },),
              ],
            ),
          )
        ),
      );
  }
}

class IconContainer extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  IconContainer({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width:200.0, 
          margin: EdgeInsets.only(left:5.0),
          padding:EdgeInsets.all(15.0),
          height: 200.0,               
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.blueAccent,
          ),
          child:  IconButton(
          icon: Icon(
           icon,
            size: 100.0,
            color: Colors.white,
          ), onPressed:onPressed,
              tooltip: 'Patient', 
            ),
      ),
    );
  }
}

