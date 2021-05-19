//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BuildLinkEvents extends StatelessWidget {
  final String? imageName;
  final String? title;
  final String? info;
  final String? date;
  final String? time;
  final String? topic;
  final String? extra;

  BuildLinkEvents(this.imageName, this.title, this.date, this.time, this.info,
      this.topic, this.extra);
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
            child: TextButton(
              onPressed: () {
                Events events =
                    Events(imageName, title, info, date, time, topic, extra);
                Navigator.pushNamed(context, '/eventsview', arguments: events);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: "$imageName",
                  fit: BoxFit.fitWidth,
                  height: MediaQuery.of(context).copyWith().size.height / 5,
                  width: double.infinity,
                  placeholder: _loader,
                  errorWidget: _error,
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
                Events events =
                    Events(imageName, title, info, date, time, topic, extra);
                Navigator.pushNamed(context, '/eventsview', arguments: events);
              },
              child: Text(
                '$title',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 35),
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

class Events {
  final String? imageName;
  final String? title;
  final String? info;
  final String? date;
  final String? time;
  final String? topic;
  final String? extra;
  Events(this.imageName, this.title, this.info, this.date, this.time,
      this.topic, this.extra);
}
