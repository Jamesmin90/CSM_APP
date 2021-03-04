import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:csm/screens/components/buildlinkevents.dart';
import 'package:csm/screens/components/getdata.dart';

class EventsList extends StatefulWidget {
  @override
  _EventsList createState() => _EventsList();
}

class _EventsList extends State<EventsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: ColorfulSafeArea(
        color: Color.fromRGBO(0, 110, 160, 1),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Color.fromRGBO(0, 110, 160, 1)),
              backgroundColor: Colors.white,
              expandedHeight: 140.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  title: SizedBox(
                height: 100,
                child: ListView(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(29, 15),
                      child: Text(
                        'Events',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 110, 160, 1),
                          fontSize: 35,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              )),
            ),
            SliverFillRemaining(
              child: Container(
                child: FutureBuilder(
                  future: GetdataEvents(
                          'https://next.json-generator.com/api/json/get/V1p1XDNst')
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
                              BuildLinkEvents(
                                  snapshot.data[index].image,
                                  snapshot.data[index].title,
                                  snapshot.data[index].date,
                                  snapshot.data[index].time,
                                  snapshot.data[index].info,
                                  snapshot.data[index].topic,
                                  snapshot.data[index].extra)
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
