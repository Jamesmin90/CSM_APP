import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold);

class OutlineImage extends StatelessWidget {
  OutlineImage({required this.image, required this.label});

  final String image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(child: Image.asset("assets/images/outline/$image")),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
