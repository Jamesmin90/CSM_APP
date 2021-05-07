import 'package:csm/screens/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewEmail extends StatefulWidget {
  @override
  _NewEmailState createState() => _NewEmailState();
}

class _NewEmailState extends State<NewEmail> {
  var _newEmailController = TextEditingController();
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
                    'Geben Sie bitte Ihre neue Email ein',
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
              TextFormField(
                decoration: InputDecoration(hintText: "Neu Email"),
                controller: _newEmailController,
              ),
              SizedBox(
                height: 15.0,
              ),
              RoundedButton(
                title: "Email ändern",
                colour: Colors.blueGrey,
                onPressed: () {
                  _changeEmail(_currentPasswordController.text,
                      _currentEmailController.text, _newEmailController.text);
                },
              ),
            ]),
      ),
    );
  }

  void _changeEmail(String password, String email, String newemail) async {
    //Create an instance of the current user.
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: email);
      auth.currentUser!
          .reauthenticateWithCredential(credential)
          .whenComplete(() => {
                FirebaseAuth.instance.currentUser!
                    .updateEmail(newemail)
                    .then((_) {
                  print("Successfully changed email");
                  Navigator.pushNamed(context, "/");
                }).catchError((error) {
                  print("Password can't be changed" + error.toString());
                  //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
                  return Fluttertoast.showToast(
                      msg: error.message,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0);
                })
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

    //Pass in the password to updatePassword.
  }
}
// ignore: must_be_immutable
