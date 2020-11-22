import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:csm/screens/components/getdata.dart';
import 'package:csm/screens/components/mybullet.dart';

class Faith extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        color: Color(0xFF263238),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.lightBlue[900]),
              backgroundColor: Colors.white,
              expandedHeight: 140.0,
              floating: true,
              pinned: true,
              //snap: false,
              flexibleSpace: FlexibleSpaceBar(
                  title: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                      width: double.infinity,
                      child: Text(
                        'Unsere Ziel',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.lightBlue[900],
                          fontSize: 25,
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
                          'https://next.json-generator.com/api/json/get/EyCuD5G9t')
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
                              Container(
                                child:
                                    Image.network(snapshot.data[index].image),
                              ),
                              SizedBox(
                                height: 30.0,
                                width: 100.0,
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              ListTile(
                                leading: MyBullet(),
                                title: Text(snapshot.data[index].text),
                              )
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
