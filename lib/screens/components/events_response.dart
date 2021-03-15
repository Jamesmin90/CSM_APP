import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EventsResponseI extends StatelessWidget {
  CollectionReference response = FirebaseFirestore.instance
      .collection('events')
      .doc("Student Meetings")
      .collection("Interessiert");
  // final QuerySnapshot snapshot =
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: response.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final int icount = snapshot.data.size;
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("Interessiert"), Text("$icount")],
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class EventsResponseB extends StatelessWidget {
  CollectionReference response = FirebaseFirestore.instance
      .collection('events')
      .doc("Student Meetings")
      .collection("Besuchen");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: response.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final int bcount = snapshot.data.size;
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("Besuchen"), Text("$bcount")],
            ),
          );
        },
      ),
    );
  }
}
//   final int icount;
//   final String bcount;

//   EventsResponse(this.icount, this.bcount);
//   //String holder;
//   @override
//   Widget build(BuildContext context) {
//     // CollectionReference response = FirebaseFirestore.instance
//     //     .collection('events')
//     //     .doc("Student Meetings")
//     //     .collection("Interessiert");

//     // return StreamBuilder<QuerySnapshot>(
//     //     stream: response.snapshots(),
//     //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     //       if (snapshot.hasError) {
//     //         return Text('Something went wrong');
//     //       }

//     //       if (snapshot.connectionState == ConnectionState.waiting) {
//     //         return Text("Loading");
//     //       }

//     //       return new ListView(
//     //         children: snapshot.data.docs.map((DocumentSnapshot document) {
//     //           return new ListTile(
//     //             //title: new Text("Title"),
//     //             subtitle: changetype(document.data().length),
//     //           );
//     //         }).toList(),
//     //       );
//     //     });

//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Column(
//                 children: <Widget>[Text("Interessiert"), Text("$icount")],
//               ),
//               Spacer(flex: 20),
//               Column(
//                 children: <Widget>[Text("Besuchen"), Text("$bcount")],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // changetype(int value) {
//   //   holder = value.toString();
//   //   return Text(holder);
//   // }
// }
