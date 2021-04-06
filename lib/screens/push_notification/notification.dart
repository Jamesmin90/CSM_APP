//import 'package:csm/screens/components/getdata.dart';
import 'package:csm/screens/components/user_topic_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationTopic extends StatefulWidget {
  //NotificationTopic({Key key}) : super(key: key);

  @override
  _NotificationTopicState createState() => _NotificationTopicState();
}

class _NotificationTopicState extends State<NotificationTopic> {
  bool _general = false;
  bool _events = false;
  bool _trips = false;
  bool _sports = false;
  String general = 'General';
  String events = 'Events';
  String trips = 'Trips';
  String sports = 'Sports';

  @override
  void initState() {
    super.initState();
    _general = UserTopicInfo.getBool(general) ?? false;
    _events = UserTopicInfo.getBool(events) ?? false;
    _trips = UserTopicInfo.getBool(trips) ?? false;
    _sports = UserTopicInfo.getBool(sports) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Center(
        child: Column(
          children: [
            SwitchListTile(
                value: _general,
                title: Text(
                  general,
                  style: TextStyle(),
                ),
                onChanged: (bool value) async {
                  setState(() {
                    _general = value;
                  });
                  setGen();
                  await UserTopicInfo.setBool(_general, general);
                }),
            SwitchListTile(
                value: _events,
                title: Text(events),
                onChanged: (bool value) async {
                  setState(() {
                    _events = value;
                  });
                  setEvents();
                  await UserTopicInfo.setBool(_events, events);
                }),
            SwitchListTile(
                value: _trips,
                title: Text('Trips'),
                onChanged: (bool value) async {
                  setState(() {
                    _trips = value;
                  });
                  setTrips();
                  await UserTopicInfo.setBool(_trips, trips);
                }),
            SwitchListTile(
                value: _sports,
                title: Text(sports),
                onChanged: (bool value) async {
                  setState(() {
                    _sports = value;
                  });
                  setSports();
                  await UserTopicInfo.setBool(_sports, sports);
                }),
          ],
        ),
      ),
    );
  }

  setGen() async {
    if (_general == false) {
      await FirebaseMessaging.instance.unsubscribeFromTopic('General');
    } else {
      await FirebaseMessaging.instance.subscribeToTopic('General');
    }
  }

  setEvents() async {
    if (_events == false) {
      await FirebaseMessaging.instance.unsubscribeFromTopic('Events');
    } else {
      await FirebaseMessaging.instance.subscribeToTopic('Events');
    }
  }

  setTrips() async {
    if (_trips == false) {
      await FirebaseMessaging.instance.unsubscribeFromTopic('Trips');
    } else {
      await FirebaseMessaging.instance.subscribeToTopic('Trips');
    }
  }

  setSports() async {
    if (_sports == false) {
      await FirebaseMessaging.instance.unsubscribeFromTopic('Sports');
    } else {
      await FirebaseMessaging.instance.subscribeToTopic('Sports');
    }
  }
}
