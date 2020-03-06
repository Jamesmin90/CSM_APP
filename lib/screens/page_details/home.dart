import 'home_banner.dart';
import 'package:flutter/material.dart';

class HomneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new ListView(
          children: [
            ImageBanner("assets/images/Eisen.jpg"),
            Padding(
              padding: EdgeInsets.all(30),
              child: Image.asset(
                "assets/images/Eisen.jpg",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Image.asset(
                "assets/images/Eisen.jpg",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Image.asset(
                "assets/images/Eisen.jpg",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
            ),
          ]
        )
      );
    }
}
