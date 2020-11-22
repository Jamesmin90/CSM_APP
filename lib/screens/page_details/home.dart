//import 'package:csm/screens/components/home_banner.dart';
import 'dart:convert';
import 'package:csm/screens/components/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:csm/screens/components/buildlink.dart';
import 'package:csm/screens/components/getdata.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
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
                  Colors.blue[600],
                  Colors.lightBlueAccent
                ])),
                child: Container(
                  child: Column(
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
                    ],
                  ),
                ),
              ),
              CustomListTile(Icons.person, 'Profile', () => {}),
              CustomListTile(Icons.notifications, 'Notifications', () => {}),
              CustomListTile(Icons.settings, 'Settings', () => {}),
              CustomListTile(Icons.lock, 'Log Out', () => {}),
            ],
          ),
        ),
      ),
      body: ColorfulSafeArea(
        color: Color(0xFF263238),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.blue[300]),
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network("https://i.imgur.com/p3CfZBS.png",
                    fit: BoxFit.cover),
              ),
            ),
            SliverFillRemaining(
              child: Container(
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
      ),
    );
  }
}
