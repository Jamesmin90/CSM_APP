//import 'package:csm/screens/components/home_banner.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Container buildlink({String imageName, String page}) {
    return Container(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '$page');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              '$imageName',
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).copyWith().size.height / 5,
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Card>> _getData() async {
    var data = await http
        .get("https://next.json-generator.com/api/json/get/VJmiHkpYF");

    var jsonData = jsonDecode(data.body);

    List<Card> cards = [];

    for (var c in jsonData) {
      Card card = Card(c["image"], c["title"]);

      cards.add(card);
    }

    print(cards.length);

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                future: _getData(),
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
                            buildlink(
                                imageName: snapshot.data[index].image,
                                page: snapshot.data[index].title)
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
}

class Card {
  final String image;
  final String title;
  Card(this.image, this.title);
}
