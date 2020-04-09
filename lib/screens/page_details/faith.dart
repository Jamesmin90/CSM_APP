import 'package:flutter/material.dart';

class Faith extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unser Glaube')
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Image.asset("assets/images/Bible3.jpg"),
          ),
          SizedBox(
            width: 100.0,
            height: 30.0,
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Container(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset("assets/images/faith.jpg"),
          ),
        ],
      ),
    );
  }
}