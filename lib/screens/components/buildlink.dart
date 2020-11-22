import 'package:flutter/material.dart';

class BuildLink extends StatelessWidget {
  String imageName;
  String page;
  String text;

  BuildLink(this.imageName, this.page, this.text);
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '$page');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  '$imageName',
                  fit: BoxFit.fitWidth,
                  height: MediaQuery.of(context).copyWith().size.height / 5,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          //Center(
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).copyWith().size.height / 5,
            child: Text(
              '$text',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 50),
            ),
            alignment: Alignment(-.8, -.8),
          ),
          //),
        ],
      ),
    );
  }
}
