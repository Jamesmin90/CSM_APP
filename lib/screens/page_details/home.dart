import 'package:csm/screens/components/home_banner.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Container buildlink({String imageName, String page}) {
    return Container(
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
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
        ImageBanner("assets/images/Banner_12resized.jpg"),
        buildlink(imageName: "Trips04a.jpg", page: '/trips'),
        buildlink(imageName: "Events 07a.jpg", page: '/events'),
        buildlink(imageName: "About us 03a.jpg", page: '/studentblog'),
        buildlink(imageName: "Bible.jpg", page: '/about')
      ]),
    );
  }
}
