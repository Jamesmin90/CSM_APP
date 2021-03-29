import 'package:flutter/material.dart';
import 'package:csm/screens/components/web_view_container.dart';

//import 'package:webview_flutter/webview_flutter.dart';

class Songbook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewContainer('https://songbase.life', 'SongBook'),
    );
  }
}

/*
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
}*/
