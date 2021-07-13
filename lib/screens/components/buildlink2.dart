import 'package:flutter/material.dart';

class BuildLink2 extends StatelessWidget {
  final String? imageName;
  final String? page;
  final String? text;

  BuildLink2(this.imageName, this.page, this.text);
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            width: double.infinity,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '$page');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('$imageName',
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).copyWith().size.height / 5,
                    width: double.infinity),
              ),
            ),
          ),
          //Center(
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).copyWith().size.height / 5,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '$page');
              },
              child: Text(
                '$text',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 50),
              ),
            ),
            alignment: Alignment(-.8, -.8),
          ),
          //),
        ],
      ),
    );
  }
}
