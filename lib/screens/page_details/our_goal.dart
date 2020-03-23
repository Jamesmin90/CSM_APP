import 'package:flutter/material.dart';
import 'package:csm/screens/components/text_section.dart';

class Ourgoal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unser Ziel')
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Image.asset("assets/images/Prayer_tower.jpg"),
          ),
          TextSection("Leben",
              "IM LEBEN GOTTES BIS ZUR REIFE ZU WACHSEN — EPH. 4:15; KOL. 1:28"),
          TextSection("Wahrheit",
              "IN DER VOLLEN ERKENNTNIS DER WAHRHEIT GEMÄSS DER HEILIGEN SCHRIFT AUSGESTATTET ZU SEIN —2. TIM. 3:16-17; 1. TIM. 2:4"),
          TextSection("Dienst",
            "UNSEREN DIENST FÜR DEN AUFBAU DIE GEMEINDE ZU ENTWICKELN — MATT. 28:19; EPH. 4:12; 1. KOR. 14:1"),
        ]
      ),
    );
  }
}