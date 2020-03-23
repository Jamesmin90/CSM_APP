import 'package:csm/screens/components/home_banner.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Expanded buildlink({String imageName, String page}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '$page');
          },
          child: Image.asset(
            "assets/images/$imageName",
          ),
        ),
      ),
    );
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Center(
          child: Column(children: <Widget>[
        ImageBanner("assets/images/Eisen.jpg"),
        buildlink(imageName: "Paris2.jpg", page: '/trips'),
        buildlink(imageName: "Thursday.jpg", page: '/events'),
        buildlink(imageName: "NCT.jpg", page: '/about')
      ])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home', style: TextStyle(color: Colors.black)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Bible', style: TextStyle(color: Colors.black)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            title: Text('Outline', style: TextStyle(color: Colors.black)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            title: Text('Songbook', style: TextStyle(color: Colors.black)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            title: Text('Audio', style: TextStyle(color: Colors.black)),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
