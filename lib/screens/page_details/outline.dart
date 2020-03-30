import 'package:flutter/material.dart';

class Outline extends StatefulWidget {
  @override
  _OutlineState createState() => _OutlineState();
}

class _OutlineState extends State<Outline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio"),
      ),
      body: Center(
        child: Text("Audio"),
      ),
    );
  }
}