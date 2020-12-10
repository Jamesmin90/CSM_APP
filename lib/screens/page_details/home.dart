//import 'package:csm/screens/components/home_banner.dart';
//import 'dart:convert';
import 'package:csm/screens/components/custom_list_tile.dart';
import 'package:flutter/material.dart';
//import 'dart:async';
//import 'package:http/http.dart' as http;
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
                title: Transform.translate(
                  offset: Offset(-13, 0),
                  child: Text(
                    'Christian Studentss in München',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                background: Transform.translate(
                  offset: Offset(-80.0, 0.0),
                  child: Container(
                    width: 0.0,
                    height: 50.0,
                    //constraints: BoxConstraints.expand(height: 100, width: 100),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: const AssetImage(
                            'assets/images/csm-white.png',
                          ),
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
                color: Color.fromRGBO(60, 120, 140, 1),
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
