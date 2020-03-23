import 'package:flutter/material.dart';
import 'package:csm/screens/components/text_section.dart';


class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Events')),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Image.asset("assets/images/livingroom.jpeg"),
          ),
          TextSection("STUDENT MEETING DONNERSTAGABENDS",
              "Komm vorbei und erlebe unsere wöchentlichen Zusammen-kommen, die jeden Donnerstag Abend stattfinden. Wir genießen die Gemeinschaft miteinander und beschäftigen uns mit Themen, die für unser christliches Leben essentiell sind, um unseren Glauben, während dem Studium, zu stärken. Schau dir die Themen an, die wir in der Vergangenheit behandelt haben!"),
          TextSection("HAUSKREISE AM FREITAG",
              "Freitags haben wir Hauskreise bei christlichen Familien, wo wir gemeinsam Abendessen, Gemeinschaft haben, zusammen singen und uns ermutigen in unserem Leben als Christen voranzugehen."),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Image.asset("assets/images/Divine_Romance.jpg"),
          ),
          TextSection("BIBLE STUDYS IN KLEINGRUPPEN",
              "Unter der Woche treffen wir uns gerne zu zweit oder zu dritt, um gemeinsam in der Bibel zu lesen und uns über verschiedene Themen und Fragen auszutauschen. Zudem wollen wir diese Zeiten nutzen, um einander besser kennenzulernen und uns gegenseitig mit Rat zur Seite stehen."),
          TextSection("BIBELLESEPLAN",
              "Regelmäßig die Bibel zu lesen ist wichtig für unseren Wachstum im christlichen Leben. Wir haben einen Leseplan in dem wir zusammen in einem Jahr das Neue Testament  lesen, so wird das Lesen der Bibel zu einer guten Gewohnheit."),
          TextSection("FREIZEITEN UND TRIPS",
              "Ab und zu besuchen wir gerne Christen in anderen Städten. Wir hoffen, dass durch diese Reisen unser Blick und Eindruck vom Leib Christi erweitert und vertieft werden kann. Weiter unten findest du ein kurzes Video über unserer jährlichen Kirchengeschichtsreise."),
        ],
      ),
    );
  }
}
