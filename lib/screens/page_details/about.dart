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
        color: Color(0xFF263238),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.lightBlue[900]),
              backgroundColor: Colors.white,
              expandedHeight: 140.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  title: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsetsDirectional.fromSTEB(28, 7, 0, 0),
                      width: double.infinity,
                      child: Text(
                        'Infos',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.lightBlue[900],
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                      width: double.infinity,
                      child: Text(
                        'About',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.lightBlue[900],
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
