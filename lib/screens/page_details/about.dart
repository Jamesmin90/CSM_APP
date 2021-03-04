import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:csm/screens/components/buildlink.dart';
import 'package:csm/screens/components/getdata.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
                  //mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(25, 21),
                      child: Text(
                        'Infos',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 110, 160, 1),
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(25, 10),
                      child: Text(
                        'About',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(0, 110, 160, 1),
                          fontSize: 45,
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
                  future: Getdata(
                          'https://next.json-generator.com/api/json/get/Ey63angqt')
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
