import 'package:flutter/material.dart';
//import 'package:http/http.dart'as http;

import 'package:csm/screens/components/web_view_container.dart';

//import 'package:webview_flutter/webview_flutter.dart';

class Bible extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewContainer(
          'https://www.bible.com/de/bible/2351/GEN.1.ELBBK', 'Bible'),
    );
  }
}

/*
const apiKey = '17b426d27b3a77918c43f7119a2eb39a';

class Bible extends StatefulWidget {
  @override
  _BibleState createState() => _BibleState();
}
void getData() async{
  http.Response response = await http.get(
    'https://api.scripture.api.bible/v1/bibles', 
    headers:{'api-key': '17b426d27b3a77918c43f7119a2eb39a'} );
  if (response.statusCode == 200){
    String data = response.body;
    print(data);

  } else{
    print(response.statusCode);
  }
}

class _BibleState extends State<Bible> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bibel"),
      ),
      body: Center(
        child: Text("Bible"),
      ),
    );
  }
}*/
