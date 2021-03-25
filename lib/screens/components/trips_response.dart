import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TripsResponseI extends StatelessWidget {
  final String postname;
  TripsResponseI(this.postname);

  // final QuerySnapshot snapshot =
  Widget build(BuildContext context) {
    CollectionReference response = FirebaseFirestore.instance
        .collection('trips')
        .doc('$postname')
        .collection("Interessiert");
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
class TripsResponseB extends StatelessWidget {
  final String postname;
  TripsResponseB(this.postname);

  @override
  Widget build(BuildContext context) {
    CollectionReference response = FirebaseFirestore.instance
        .collection('trips')
        .doc("$postname")
        .collection("Besuchen");
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
