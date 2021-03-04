//import 'package:csm/screens/components/buildlink.dart';
import 'package:flutter/material.dart';
import 'package:csm/screens/components/buildlinkevents.dart';

class EventsViewModel extends StatefulWidget {
  // final String title;
  // final String date;
  // final String time;
  // final String info;
  // final String topic;
  // final String extra;
  // final String image;

  // EventsViewModel(
  //     {this.title,
  //     this.date,
  //     this.time,
  //     this.info,
  //     this.topic,
  //     this.extra,
  //     this.image});

  @override
  _EventsViewModelState createState() => _EventsViewModelState();
}

class _EventsViewModelState extends State<EventsViewModel> {
  Events events;
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    events = settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverPersistentHeader(
          //   pinned: false,
          //   floating: true,
          //   delegate: EventsPageHeader(
          //       maxExtent: 250.0, minExtent: 150.0, title: this.events.title),
          // ),
          SliverAppBar(
            iconTheme: IconThemeData(color: Color.fromRGBO(0, 110, 160, 1)),
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/milkyway.jpg',
                fit: BoxFit.cover,
              ),
              // title: SizedBox(
              //   height: 100,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     //crossAxisAlignment: CrossAxisAlignment.stretch,
              //     children: <Widget>[
              //       SizedBox(height: 10),
              //       Container(
              //         padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
              //         width: double.infinity,
              //         child: Text(
              //           'Student meeting',
              //           style: TextStyle(
              //             fontWeight: FontWeight.w900,
              //             color: Colors.lightBlue[900],
              //             fontSize: 25,
              //           ),
              //           textAlign: TextAlign.left,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ),
          ),
          SliverFillRemaining(
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              this.events.title,
                              style: TextStyle(
                                fontSize: 31,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              this.events.date,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 32),
                            Text(
                              this.events.time,
                              style: TextStyle(
                                  fontSize: 31, fontWeight: FontWeight.w300),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 15),
                            Text(
                              this.events.info,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              //fontWeight: FontWeight.w500),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
