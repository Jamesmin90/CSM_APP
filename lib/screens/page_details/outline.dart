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
        title: Text("Outline"),
      ),
      body: Center(
        child: Text("Outline"),
      ),
    );
  }
}