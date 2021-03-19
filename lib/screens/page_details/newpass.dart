import 'package:csm/screens/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class NewPass extends StatefulWidget {
  NewPass({Key key}) : super(key: key);

  @override
  _NewPassState createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  var _newPasswordController = TextEditingController();
  var _currentPasswordController = TextEditingController();
  var _currentEmailController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool checkCurrentPasswordValid = true;
  @override
  void dispose() {
    _newPasswordController.dispose();
    _currentEmailController.dispose();
    _currentPasswordController.dispose();
    super.dispose();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

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
                    'Geben Sie bitte Ihr neues Passwort ein',
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
                validator: validatePassword,
                decoration: InputDecoration(
                    hintText: "Passwort",
                    errorText: checkCurrentPasswordValid
                        ? null
                        : "Bitte überprüfen Sie Ihr Passwort"),
                controller: _currentPasswordController,
              ),
              TextFormField(
                validator: validatePassword,
                decoration: InputDecoration(hintText: "Neu Passwort"),
                controller: _newPasswordController,
                obscureText: true,
              ),
              SizedBox(
                height: 15.0,
              ),
              RoundedButton(
                title: "Passwort ändern",
                colour: Colors.blueGrey,
                onPressed: () => _changePassword(
                    _newPasswordController.text,
                    _currentEmailController.text,
                    _currentPasswordController.text),
              ),
            ]),
      ),
    );
  }

  void _changePassword(
      String password, String email, String oldpassword) async {
    //Create an instance of the current user.
    try {
      EmailAuthCredential credential =
          EmailAuthProvider.credential(email: email, password: oldpassword);
      auth.currentUser
          .reauthenticateWithCredential(credential)
          .whenComplete(() => {
                FirebaseAuth.instance.currentUser
                    .updatePassword(password)
                    .then((_) {
                  print("Successfully changed password");
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
  }
}
