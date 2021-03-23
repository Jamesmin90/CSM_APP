import 'package:csm/screens/components/events_button.dart';
import 'package:csm/screens/components/events_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:csm/screens/components/buildlinkevents.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
              background: CachedNetworkImage(
                imageUrl: this.events.imageName,
                fit: BoxFit.cover,
                placeholder: _loader,
                errorWidget: _error,
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
                          response(),
                          topic(text: this.events.topic),
                          textSection(text: this.events.info),
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

  // ignore: non_constant_identifier_names
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

  response() {
    return Container(
        height: MediaQuery.of(context).size.height / 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 30.0,
            ),
            Container(
              child: EventsResponseI(this.events.title),
              height: 100,
              width: 150,
            ),
            Container(
              child: EventsResponseB(this.events.title),
              height: 100,
              width: 150,
            ),
          ],
        ));
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

  Widget topic({
    @required String text,
  }) =>
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 33),
        child: Text(
          text,
          softWrap: true,
        ),
      );
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
