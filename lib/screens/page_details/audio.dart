import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:csm/screens/components/web_view_container.dart';

class Audio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio"),
      ),
      body: WebViewContainer('https://www.csmuenchen.de'),
    );
  }
}

/*
class Audio extends StatefulWidget {
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio"),
      ),
      body: WebView(
        key: UniqueKey(),
        initialUrl: "http://google.com",
        javascriptMode: JavascriptMode.unrestricted
        
      ),
    );
  }
} */