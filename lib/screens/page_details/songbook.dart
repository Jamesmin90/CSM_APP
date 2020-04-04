import 'package:flutter/material.dart';

class Songbook extends StatefulWidget {
  @override
  _SongbookState createState() => _SongbookState();
}

class _SongbookState extends State<Songbook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Songbook"),
      ),
      body: Center(
        child: Text("Songbook"),
      ),
    );
  }
}