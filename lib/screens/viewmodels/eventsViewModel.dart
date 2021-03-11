import 'package:csm/screens/components/events_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:csm/screens/components/buildlinkevents.dart';

class EventsViewModel extends StatefulWidget {
  @override
  _EventsViewModelState createState() => _EventsViewModelState();
}

class _EventsViewModelState extends State<EventsViewModel> {
  Events events;
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    events = settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: Color.fromRGBO(0, 110, 160, 1)),
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/milkyway.jpg',
                fit: BoxFit.cover,
              ),
              title: Text(
                this.events.title,
                style: TextStyle(fontFamily: "Poppins"),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: [
                          titleSection(title: this.events.title),
                          check_login(),
                          textSection(text: this.events.info)
                        ],
                      ),
                      //)
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

  Widget titleSection({
    @required String title,
  }) =>
      Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    this.events.date,
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            Text(this.events.time)
          ],
        ),
      );

  Widget buildHeader({
    @required Widget child,
    @required String title,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          child,
        ],
      );

  check_login() {
    if (auth.currentUser != null) {
      return buildHeader(
        title: 'Interessiert oder Besuchen',
        child: EventsButton(this.events.title),
      );
    } else {
      return Text("bitte einloggen, um RSVP zu machen");
    }
  }

  Widget textSection({
    @required String text,
  }) =>
      Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          text,
          softWrap: true,
        ),
      );
}
