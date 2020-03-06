import 'package:flutter/material.dart';
import 'screens/page_details/home.dart';
class CSM extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "CSM!",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Home")
        ),
       body: new HomneWidget(),
       
      ) 
    );
    
  } 
  
  }

