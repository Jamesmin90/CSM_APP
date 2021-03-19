import 'package:csm/screens/push_notification/message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessagingWidget extends StatefulWidget {
  MessagingWidget({Key key}) : super(key: key);

  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  notificate() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  getToken() async {
    String token = await _firebaseMessaging.getToken(
      vapidKey:
          "BNuds1CxDkro3u8LjHzc3PpXtL-cUqiLBhsTUWubuA20DsLJcq6KNyzr86AyY2hxcwtVMvz0b0nmCvwDHNLX_Mk",
    );
  }

  final List<Message> messages = [];

  @override
  Future<void> initState() async {
    super.initState();
    notificate();
    getToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        final notification = message.notification;
        setState(() {
          messages
              .add(Message(title: notification.title, body: notification.body));
        });
      }
    });
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
// Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage?.data['type'] == 'events') {
      Navigator.pushNamed(
        context,
        '/events',
      );
    }
    if (initialMessage?.data['type'] == 'trips') {
      Navigator.pushNamed(
        context,
        '/trips',
      );
    }
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['type'] == 'events') {
        Navigator.pushNamed(
          context,
          '/events',
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['type'] == 'trips') {
        Navigator.pushNamed(
          context,
          '/trips',
        );
      }
    });

    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print("onMessage: $message");
    //     final notification = message['notification'];
    //     setState(() {
    //       messages.add(Message(
    //           title: notification['title'], body: notification['body']));
    //     });
    //   },
    //   onBackgroundMessage: myBackgroundMessageHandler,
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //     final notification = message['notification'];
    //     setState(() {
    //       messages.add(Message(
    //           title: notification['title'], body: notification['body']));
    //     });
    //     Navigator.pushNamed(context, '/notification');
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //     final notification = message['notification'];
    //     setState(() {
    //       messages.add(Message(
    //           title: notification['title'], body: notification['body']));
    //     });
    //     Navigator.pushNamed(context, '/notification');
    //   },
    // );
    // _firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(sound: true, badge: true, alert: true));
    // _firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
        ),
        body: ListView(
          children: messages.map(buildMessage).toList(),
        ),
      );

  Widget buildMessage(Message message) => ListTile(
        title: Text(message.title),
        subtitle: Text(message.body),
      );
}
