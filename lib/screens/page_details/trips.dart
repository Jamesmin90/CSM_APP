import 'package:flutter/material.dart';

class Trips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trips')
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Image.asset("assets/images/Netherlands1.jpeg"),
          ),
        ],
      ),
    );
  }
}