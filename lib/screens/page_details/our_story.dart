import 'package:flutter/material.dart';

class Ourstory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unsere Geschichte')),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Image.asset("assets/images/NCT.jpg"),
          ),
          SizedBox(
            height: 30.0,
            width: 100.0,
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 1.0, 16, 16.0),
            child: Text(
                "Willkommen! Christliche Studenten München (CSM) ist eine christliche Studentengruppe, die Jesus nachfolgt, “zusammen mit denen, die den Herrn aus einem reinen Herzen anrufen”.  (2. Tim. 2:22). Wir lieben Jesus und sein Wort und wollen uns gegenseitig helfen, den Willen Gottes der Bibel nach zu entdecken und das tägliche Leben als Christ zu leben. Wir heißen Studenten mit jeglichen konfessionellen Hintergründen willkommen, die in ihrer Beziehung zum Herrn während ihrer Jahre an der Universität wachsen wollen. Unser Wunsch ist es, “dass alle Menschen gerettet werden und zur völligen Erkenntnis der Wahrheit kommen”. (1. Tim. 2:4). Check unsere Events aus und kontaktiere uns, um noch mehr Informationen zu erhalten.",
                style: Theme.of(context).textTheme.bodyText2),
          ),
        ],
      ),
    );
  }
}
