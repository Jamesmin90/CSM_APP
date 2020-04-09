import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:csm/screens/components/text_section.dart';


class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Events')),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/json/data.json"),
        builder: (context, snapshot){
          var mydata = json.decode(snapshot.data.toString());
          return ListView(
        children: <Widget>[ 
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Image.asset("assets/images/livingroom.jpeg"),
          ),
          TextSection(mydata["events_1"]["title"], mydata["events_1"]["content"]),
          TextSection(mydata["events_2"]["title"],mydata["events_2"]["content"]),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Image.asset("assets/images/Divine_Romance.jpg"),
          ),
          TextSection(mydata["events_3"]["title"],mydata["events_3"]["content"]),
          TextSection(mydata["events_4"]["title"],mydata["events_4"]["content"]),
          TextSection(mydata["events_5"]["title"],mydata["events_5"]["content"])
        ],
      );
        },
      ),
    );
  }
}

