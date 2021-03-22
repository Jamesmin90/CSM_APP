import 'package:csm/screens/components/custom_list_tile.dart';
// import 'package:csm/screens/push_notification/locator.dart';
// import 'package:csm/screens/push_notification/push_notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:csm/screens/components/constants.dart';
import 'package:csm/screens/components/buildlink.dart';
import 'package:csm/screens/components/getdata.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  bool isAuth = false;
  // final PushNotificationService _pushNotificationService =
  //     locator<PushNotificationService>();
  @override
  void initState() {
    super.initState();
    // detects when your is signed in
    auth.authStateChanges().listen((User user) {
      if (user != null) {
        print('User signed in: $user.');
        setState(() {
          isAuth = true;
        });
      } else {
        setState(() {
          isAuth = false;
        });
      }
    }, onError: (err) {
      print("Error signing in: $err");
    });

    // handleStartUpLogic();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        width: MediaQuery.of(context).copyWith().size.height / 3,
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Color.fromRGBO(0, 110, 160, 1),
                  Colors.lightBlueAccent
                ])),
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        child: Image.network(
                          "https://i.imgur.com/b1XF5aP.png",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      signin_signout(),
                    ],
                  ),
                ),
              ),
              signin_profile(),
              CustomListTile(Icons.notifications, 'Notifications',
                  () => {Navigator.pushNamed(context, '/notification')}),
              CustomListTile(Icons.settings, 'Settings', () => {}),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Color.fromRGBO(250, 255, 255, 1)),
            expandedHeight: MediaQuery.of(context).size.height / 4,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Transform.translate(
                offset: Offset(-13, 0),
                child: FittedBox(
                  alignment: Alignment.center,
                  child: Text(
                    'Christian Students in München',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              background: Transform.translate(
                offset: Offset(-75.0, 0.0),
                child: Container(
                  width: 0.0,
                  height: 50.0,
                  //constraints: BoxConstraints.expand(height: 100, width: 100),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: csm_white,
                        //fit: BoxFit.cover,
                        scale: 5),
                  ),
                ),
              ),

              //fit: BoxFit.cover),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              color: Color.fromRGBO(0, 110, 160, 1),
              child: FutureBuilder(
                future: Getdata(
                        'https://next.json-generator.com/api/json/get/VJmiHkpYF')
                    .getData(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            BuildLink(
                                snapshot.data[index].image,
                                snapshot.data[index].title,
                                snapshot.data[index].text)
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // function to sign in or sign out
  // ignore: non_constant_identifier_names
  signin_signout() {
    if (isAuth == false) {
      return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/welcome_screen');
        },
        child: Row(children: [
          Container(
            child: Icon(
              Icons.login_outlined,
              color: Colors.white,
            ),
            alignment: Alignment.bottomLeft,
          ),
          SizedBox(
            width: 5.0,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Log in",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      );
    } else if (isAuth == true) {
      return TextButton(
        onPressed: () {
          auth.signOut();
          Navigator.pushNamed(context, '/');
        },
        child: Row(children: [
          Container(
            child: Icon(
              Icons.lock_outlined,
              color: Colors.white,
            ),
            alignment: Alignment.bottomLeft,
          ),
          SizedBox(
            width: 5.0,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Log out",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      );
    }
  }

  // ignore: non_constant_identifier_names
  signin_profile() {
    if (isAuth == true) {
      return CustomListTile(
          Icons.person,
          'Profile',
          () => {
                Navigator.pushNamed(context, '/profile'),
              });
    } else if (isAuth == false) {
      return Text("");
    }
  }

  // Future handleStartUpLogic() async {
  //   await _pushNotificationService.initialise();
  // }
}
