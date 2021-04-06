class Card {
  final String image;
  final String title;
  final String text;
  Card(this.image, this.title, this.text);
}

class CardEvents {
  String image;
  String title;
  String info;
  String date;
  String time;
  String topic;
  String extra;
  CardEvents(this.image, this.title, this.info, this.date, this.time,
      this.topic, this.extra);
}

class CardTopic {
  String topic;

  CardTopic(this.topic);
}
