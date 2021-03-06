import 'package:cached_network_image/cached_network_image.dart';
import 'package:csm/screens/components/buildlinktrips.dart';
import 'package:csm/screens/components/trips_button.dart';
import 'package:csm/screens/components/trips_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TripsViewModel extends StatefulWidget {
  @override
  _TripsViewModelState createState() => _TripsViewModelState();
}

class _TripsViewModelState extends State<TripsViewModel> {
  Trips trips;
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    trips = settings.arguments;
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
                imageUrl: this.trips.imageName,
                fit: BoxFit.cover,
                placeholder: _loader,
                errorWidget: _error,
              ),
              title: Text(
                this.trips.title,
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
                          titleSection(title: this.trips.title),
                          check_login(),
                          response(),
                          topic(text: this.trips.topic),
                          textSection(text: this.trips.info),
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
                    this.trips.date,
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            Text(this.trips.time)
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
        child: TripsButton(this.trips.title),
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
              child: TripsResponseI(this.trips.title),
              height: 100,
              width: 150,
            ),
            Container(
              child: TripsResponseB(this.trips.title),
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
