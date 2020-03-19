import 'package:flutter/material.dart';
import 'screens/page_details/home.dart';
import 'package:csm/screens/page_details/events.dart';
import 'package:csm/screens/page_details/trips.dart';
import 'package:csm/screens/page_details/about.dart';


void main() => runApp(CSM());

class CSM extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF263238),
      ),
      title: "CSM!",
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/events': (context) => Events(),
        '/trips': (context) => Trips(),
        '/about': (context) => About(),
      }
       
      ); 
    
  } 
  
  }