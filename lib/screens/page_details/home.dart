import 'package:csm/screens/components/custom_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:csm/screens/components/constants.dart';
import 'package:csm/screens/components/buildlink.dart';
import 'package:csm/screens/components/getdata.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  bool isAuth = false;

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
    final mediaQuery = MediaQuery.of(context);
    final availableWidth = mediaQuery.size.width - 160;
    final mSize = mediaQuery.size;
    return Scaffold(
      endDrawer: Container(
        width: mediaQuery.copyWith().size.height / 3,
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
                        child: CachedNetworkImage(
                          imageUrl: "https://i.imgur.com/b1XF5aP.png",
                          placeholder: _loader,
                          errorWidget: _error,
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
            expandedHeight: mediaQuery.size.height / 4,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(0.0),
              title: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: availableWidth,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: mediaQuery.size.width / 65),
                    child: Container(
                      //color: Colors.green,
                      child: Text(
                        'Christian Students in München',
                        style: TextStyle(fontSize: mediaQuery.size.height / 55),
                      ),
                    ),
                  )),
              background: Container(
                padding: EdgeInsetsDirectional.fromSTEB(mSize.width / 65,
                    mSize.height / 15, mSize.height / 15, mSize.height / 15),
                child: Image.asset('assets/images/csm-white.png'),
                margin: EdgeInsetsDirectional.only(end: mSize.width / 4),
              ),
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
