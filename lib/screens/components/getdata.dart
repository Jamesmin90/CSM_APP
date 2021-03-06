import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:csm/screens/components/card.dart';

class Getdata {
  String url;

  Getdata(this.url);

  Future<List<Card>> getData() async {
    var newUrl = Uri.parse(url);
    var data = await http.get(newUrl);

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

class Getdatanotification {
  String url;

  Getdatanotification(this.url);

  Future<List<CardTopic>> getData() async {
    var newUrl = Uri.parse(url);
    var data = await http.get(newUrl);

    var jsonData = jsonDecode(data.body);

    List<CardTopic> cards = [];

    for (var c in jsonData) {
      CardTopic card = CardTopic(c["topic"]);

      cards.add(card);
    }

    print(cards.length);

    return cards;
  }
}

class GetdataEvents {
  String url;

  GetdataEvents(this.url);

  Future<List<CardEvents>> getData() async {
    var newUrl = Uri.parse(url);
    var data = await http.get(newUrl);

    var jsonData = jsonDecode(data.body);

    List<CardEvents> cards = [];

    for (var c in jsonData) {
      CardEvents card = CardEvents(c["image"], c["title"], c["info"], c["date"],
          c["time"], c["topic"], c["extra"]);

      cards.add(card);
    }

    print(cards.length);

    return cards;
  }
}
