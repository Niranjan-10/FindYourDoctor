import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fyd/constants.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: doctorBackgroundColor,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 20.0, height: 100.0),
                      Expanded(
                          child: Text(
                          "Any",
                          style: TextStyle(fontSize: 43.0),
                        ),
                      ),
                      SizedBox(width: 20.0, height: 100.0),
                      Expanded(
                          child: RotateAnimatedTextKit(
                          onTap: () {
                            print("Tap Event");
                          },
                          text: ["Time", "Where"],
                          textStyle: TextStyle(
                            fontSize: 40.0, 
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                        ),
                      ),
                    ],
                    ),
                ),
              )
            ],),
        ),
      ),
    );
  }
}