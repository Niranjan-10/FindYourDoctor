import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


var kInputDecoration = InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: '',
                                      hintStyle: TextStyle(
                                        color: Colors.blueAccent,
                                        fontFamily: 'NotoSans',
                                        fontWeight: FontWeight.bold
                                      ),
                                      prefixIcon: Icon(
                                        FontAwesomeIcons.at,
                                        size: 20.0,
                                        color: Colors.blueAccent,
                                        ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                        border: UnderlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white54, width: 1.0),
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white, width: 2.0),
                                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                        ),
                                      );

   var DoctorInputDecoration = InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: '',
                          hintStyle: TextStyle(
                            color: doctorBackgroundColor,
                            fontWeight: FontWeight.bold, 
                            fontFamily: 'Raleway'                    
                          ),
                          
                         contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                              border: UnderlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                              ),
                         focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.white, width: 2.0),
                                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                              ),
                        enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: Colors.white54, width: 1.0),
                                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                              ),
                        );                                    


 var doctorBackgroundColor = Color(0xFFF1908C);
 var doctorForegroundColor = Color(0xFFF5BCBA);