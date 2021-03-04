import 'package:flutter/material.dart';
import 'package:csm/screens/page_details/bible.dart';
import 'package:csm/screens/page_details/audio.dart';
import 'package:csm/screens/page_details/outline.dart';
import 'package:csm/screens/page_details/songbook.dart';
import 'package:csm/screens/page_details/home.dart';

class NaviHome extends StatefulWidget {
  @override
  _NaviHomeState createState() => _NaviHomeState();
}

class _NaviHomeState extends State<NaviHome> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Bible(),
    Outline(),
    Songbook(),
    Audio()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromRGBO(0, 110, 160, 1),
            ),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: Color.fromRGBO(0, 110, 160, 1),
            ),
            label: ('Bible'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_bulleted,
              color: Color.fromRGBO(0, 110, 160, 1),
            ),
            label: ('Outline'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_music,
              color: Color.fromRGBO(0, 110, 160, 1),
            ),
            label: ('Songbook'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.music_note,
              color: Color.fromRGBO(0, 110, 160, 1),
            ),
            label: ('Audio'),
          ),
        ],
      ),
    );
  }
}
