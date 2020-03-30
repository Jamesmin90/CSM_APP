import 'package:flutter/material.dart';

class Bible extends StatefulWidget {
  @override
  _BibleState createState() => _BibleState();
}

class _BibleState extends State<Bible> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bibel"),
      ),
      body: Center(
        child: Text("Elberfelder Bibel"),
      ),
    );
  }
}