import 'package:flutter/material.dart';
class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  Expanded buildlink({String imageName, String page}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '$page');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset("assets/images/$imageName"),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About')
      ),
      body: new Center(
          child: Column(children: <Widget>[
        buildlink(imageName: "Eisen.jpg", page: '/ourstory'),
        buildlink(imageName: "coffee-and-bible.jpg", page: '/faith'),
        buildlink(imageName: "Bible.jpg", page: '/ourgoal')
      ])),
    );
  }
}
