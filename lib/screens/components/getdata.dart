import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:csm/screens/components/card.dart';

class Getdata {
  String url;

  Getdata(this.url);

  Future<List<Card>> getData() async {
    var data = await http.get(url);

    var jsonData = jsonDecode(data.body);

    List<Card> cards = [];

    for (var c in jsonData) {
      Card card = Card(c["image"], c["title"], c["text"]);

      cards.add(card);
    }

    print(cards.length);

    return cards;
  }
}
