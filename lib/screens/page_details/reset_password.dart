import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:csm/screens/components/rounded_button.dart';
import 'package:csm/screens/components/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

final GoogleSignIn googleSignIn = GoogleSignIn();

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final auth = FirebaseAuth.instance;
  //final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''), // You can add title here
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
                  'Passwort zurücksetzen',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Bitten Geben Sie die Em-Mail-Adresse ein. Wir senden Ihnen einen Link, mit dem Sie Ihr altes Passwort zurücksetzen und ein neues Password erstellen können.',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'E-Mail',
                      icon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 8.0,
                ),
                SizedBox(height: 8.0),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Neues Passwort anfordern',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    auth.sendPasswordResetEmail(email: _email);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
