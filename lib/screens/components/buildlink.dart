import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildLink extends StatelessWidget {
  final String imageName;
  final String page;
  final String text;

  BuildLink(this.imageName, this.page, this.text);
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
                child: CachedNetworkImage(
                  imageUrl: '$imageName',
                  placeholder: _loader,
                  errorWidget: _error,
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

  Widget _loader(BuildContext context, String url) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error(BuildContext context, String url, dynamic error) {
    print(error);
    return Center(
      child: Icon(Icons.error_outline),
    );
  }
}
