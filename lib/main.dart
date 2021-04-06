import 'package:csm/screens/components/user_topic_info.dart';
import 'package:csm/screens/page_details/anmelden_screen.dart';
import 'package:csm/screens/page_details/audio.dart';
import 'package:csm/screens/page_details/delete_user.dart';
import 'package:csm/screens/page_details/faith.dart';
import 'package:csm/screens/page_details/newemail.dart';
import 'package:csm/screens/page_details/newpass.dart';
import 'package:csm/screens/page_details/our_goal.dart';
import 'package:csm/screens/page_details/our_story.dart';
import 'package:csm/screens/page_details/profile.dart';
import 'package:csm/screens/page_details/reset_password.dart';
import 'package:csm/screens/page_details/settings.dart';
import 'package:csm/screens/page_details/trips_detail.dart';
import 'package:csm/screens/push_notification/notification.dart';
import 'package:csm/screens/viewmodels/to_do_list.dart';
import 'package:csm/screens/viewmodels/eventsViewModel.dart';
import 'package:csm/screens/viewmodels/todos.dart';
import 'package:csm/screens/viewmodels/tripsViewModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/page_details/navihome.dart';
import 'package:csm/screens/page_details/eventslist.dart';
import 'package:csm/screens/page_details/trips.dart';
import 'package:csm/screens/page_details/about.dart';
import 'package:csm/screens/components/constants.dart';
import 'package:csm/screens/page_details/welcome_screen.dart';
import 'package:csm/screens/page_details/registration_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  RemoteMessage initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage.data['view'] == 'Events') {
    return EventsList();
  }
  if (initialMessage.data['view'] == 'Trips') {
    return Trips();
  }
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await UserTopicInfo.init();
  runApp(CSM());
}

class CSM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(0, 110, 160, 1),
          fontFamily: 'Poppins',
          appBarTheme:
              AppBarTheme(textTheme: TextTheme(headline6: AppBarTextStyle)),
          textTheme: TextTheme(
            headline6: TitleTextStyle,
            bodyText2: Body1TextStyle,
          ),
        ),
        title: "CSM!",
        initialRoute: '/',
        routes: {
          '/': (context) => NaviHome(),
          '/events': (context) => EventsList(),
          '/trips': (context) => Trips(),
          '/about': (context) => About(),
          '/ourstory': (context) => Ourstory(),
          '/faith': (context) => Faith(),
          '/ourgoal': (context) => Ourgoal(),
          '/test': (context) => Audio(),
          '/eventsview': (context) => EventsViewModel(),
          '/welcome_screen': (context) => WelcomeScreen(),
          '/register_screen': (context) => RegistrationScreen(),
          '/anmelden_screen': (context) => AnmeldenScreen(),
          '/reset': (context) => ResetScreen(),
          '/profile': (context) => Profile(),
          '/newpass': (context) => NewPass(),
          '/newemail': (context) => NewEmail(),
          '/delete_user': (context) => DeleteUser(),
          '/notification': (context) => NotificationTopic(),
          '/trips_detail': (context) => TripsDetail(),
          '/tripsview': (context) => TripsViewModel(),
          '/to_do_list': (context) => ToDoList(),
          '/settings': (context) => Settings(),
        },
      ),
    );
  }
}
