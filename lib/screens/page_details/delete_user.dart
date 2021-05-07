import 'package:csm/screens/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeleteUser extends StatefulWidget {
  @override
  _DeleteUserState createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
  var _currentPasswordController = TextEditingController();
  var _currentEmailController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool checkCurrentPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ), // You can add title here
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //You can make this transparent
        elevation: 0.0, //No shadow
      ),
      backgroundColor: Color.fromRGBO(0, 110, 160, 1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Möchten Sie wirklich Ihr Profil entgültig löschen?',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "email",
                    errorText: checkCurrentPasswordValid
                        ? null
                        : "Bitte überprüfen Sie Ihr Email"),
                controller: _currentEmailController,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Passwort",
                    errorText: checkCurrentPasswordValid
                        ? null
                        : "Bitte überprüfen Sie Ihr Passwort"),
                controller: _currentPasswordController,
                obscureText: true,
              ),
              SizedBox(
                height: 15.0,
              ),
              RoundedButton(
                title: "Ja - endgültig löschen",
                colour: Colors.blueGrey,
                onPressed: () async {
                  authenticateUser(_currentEmailController.text,
                      _currentPasswordController.text);
                },
              ),
            ]),
      ),
    );
  }

  authenticateUser(String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      auth.currentUser!
          .reauthenticateWithCredential(credential)
          .whenComplete(() => {
                FirebaseAuth.instance.currentUser!.delete(),
                print("use deleted"),
                Navigator.pushNamed(context, "/"),
              });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
