import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventsButton extends StatefulWidget {
  final String postname;

  EventsButton(this.postname);
  @override
  _EventsButtonState createState() => _EventsButtonState(this.postname);
}

class _EventsButtonState extends State<EventsButton> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var user;
  List<bool> isSelected = [false, false];
  bool iSelected = false;
  bool bSelected = false;
  String uid;
  String postname;
  void initState() {
    super.initState();
    setState(() {
      user = auth.currentUser;
      uid = user.uid;
      postname = widget.postname;
      print(postname);
    });
  }

  _EventsButtonState(String postname);
  data2Collection(int index) {
    if (index == 0) {
      setState(() {
        iSelected = !iSelected;
        bSelected = false;
      });
      return _interessiert();
    } else if (index == 1) {
      setState(() {
        iSelected = false;
        bSelected = !bSelected;
      });
      return _besuchen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      selectedColor: Colors.white,
      color: Colors.black,
      fillColor: Colors.lightBlue.shade900,
      renderBorder: false,
      // borderWidth: 4,
      // borderColor: Colors.black87,
      selectedBorderColor: Colors.lightBlue,
      borderRadius: BorderRadius.circular(50),
      constraints: BoxConstraints(minWidth: 150, minHeight: 50),
      children: <Widget>[
        Icon(Icons.star_outline, size: 40.0),
        Icon(
          Icons.check_box_outlined,
          size: 40.0,
        ),
      ],
      onPressed: (int newIndex) {
        data2Collection(newIndex);
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = !isSelected[index];
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
    );
  }

  _interessiert() {
    if (iSelected == true) {
      FirebaseFirestore.instance
          .collection("events")
          .doc(postname)
          .collection("Interessiert")
          .doc(uid)
          .set({
        uid: "Interessiert",
      });

      FirebaseFirestore.instance
          .collection("events")
          .doc(postname)
          .collection("Besuchen")
          .doc(uid)
          .delete();
    } else {
      FirebaseFirestore.instance
          .collection("events")
          .doc(postname)
          .collection("Interessiert")
          .doc(uid)
          .delete();
    }
  }

  _besuchen() {
    if (bSelected == true) {
      FirebaseFirestore.instance
          .collection("events")
          .doc(postname)
          .collection("Besuchen")
          .doc(uid)
          .set({
        uid: "Besuchen",
      });

      FirebaseFirestore.instance
          .collection("events")
          .doc(postname)
          .collection("Interessiert")
          .doc(uid)
          .delete();
    } else {
      FirebaseFirestore.instance
          .collection("events")
          .doc(postname)
          .collection("Besuchen")
          .doc(uid)
          .delete();
    }
  }
}
