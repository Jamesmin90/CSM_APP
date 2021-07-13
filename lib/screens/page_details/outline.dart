import 'package:flutter/material.dart';
//import 'package:csm/screens/components/reusablecard.dart';
//import 'package:csm/screens/components/outlineimage.dart';
import 'package:csm/screens/components/web_view_container.dart';

//import 'package:webview_flutter/webview_flutter.dart';

class Outline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewContainer('https://csmuenchen.de/themen/', 'Outline'),
    );
  }
}

/*
const activeCardColour = Colors.white;

class Outline extends StatefulWidget {
  @override
  _OutlineState createState() => _OutlineState();
}

class _OutlineState extends State<Outline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        title: Text("Outline"),
      ),
      body: ListView(
        children:<Widget>[
          Container(
            height: 180.0,
            width: 200.0,
            child:Row(
              children: <Widget>[
                FlatButton(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: OutlineImage(
                      image: 'Divine_Romance.jpg',
                      label: 'The Divine Romance in German'
                    ),
                  ),
                  onPressed: () => _handleURLButtonPress(context, 'http://christianstudentsinmunich.blot.im/go%CC%88ttliche-liebesgeschichte'),
                ),
                FlatButton(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: OutlineImage(
                      image: 'Divine_Romance.jpg',
                      label: 'The Divine Romance'
                    ),
                  ),
                  onPressed: () => _handleURLButtonPress(context, 'http://christianstudentsinmunich.blot.im/the-divine-romance'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }
*/
