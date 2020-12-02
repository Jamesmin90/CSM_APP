import 'package:csm/screens/components/buildlink.dart';
import 'package:flutter/material.dart';
//import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:csm/screens/viewmodels/eventsPageheader.dart';

class EventsViewModel extends StatefulWidget {
  @override
  _EventsViewModelState createState() => _EventsViewModelState(this.title);
}

class _EventsViewModelState extends State<EventsViewModel> {
  String title;
  String date;
  String time;

  _EventsViewModelState(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: false,
            floating: true,
            delegate: EventsPageHeader(maxExtent: 250.0, minExtent: 150.0),
          ),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
