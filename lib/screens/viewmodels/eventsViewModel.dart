//import 'package:csm/screens/components/buildlink.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
//import 'package:csm/screens/viewmodels/eventsPageheader.dart';
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
      body: ColorfulSafeArea(
        color: Color(0xFF263238),
        child: CustomScrollView(
          slivers: <Widget>[
            // SliverPersistentHeader(
            //   pinned: false,
            //   floating: true,
            //   delegate: EventsPageHeader(
            //       maxExtent: 250.0, minExtent: 150.0, title: this.events.title),
            // ),
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.blue[300]),
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
                                style: GoogleFonts.fredokaOne(
                                    fontSize: 31,
                                    color: Color.fromRGBO(60, 120, 140, 1),
                                    fontWeight: FontWeight.w900,
                                    decorationColor: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                this.events.date,
                                style: GoogleFonts.fredokaOne(
                                    fontSize: 25,
                                    color: Color.fromRGBO(60, 120, 140, 1),
                                    //fontWeight: FontWeight.w300,
                                    decorationColor: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 32),
                              Text(
                                this.events.time,
                                style: GoogleFonts.fredokaOne(
                                    fontSize: 31,
                                    color: Color.fromRGBO(60, 120, 140, 1),
                                    fontWeight: FontWeight.w300),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 15),
                              Text(
                                this.events.info,
                                style: GoogleFonts.fredokaOne(
                                  fontSize: 20,
                                  color: Color.fromRGBO(60, 120, 140, 1),
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
      ),
    );
  }
}
