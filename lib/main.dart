import 'package:csm/screens/page_details/anmelden_screen.dart';
import 'package:csm/screens/page_details/audio.dart';
import 'package:csm/screens/page_details/faith.dart';
import 'package:csm/screens/page_details/our_goal.dart';
import 'package:csm/screens/page_details/our_story.dart';
import 'package:csm/screens/page_details/reset_password.dart';
import 'package:csm/screens/viewmodels/eventsViewModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/page_details/navihome.dart';
import 'package:csm/screens/page_details/eventslist.dart';
import 'package:csm/screens/page_details/trips.dart';
import 'package:csm/screens/page_details/about.dart';
import 'package:csm/screens/components/constants.dart';
import 'package:csm/screens/page_details/welcome_screen.dart';
import 'package:csm/screens/page_details/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CSM());
}

class CSM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
    );
  }
}
