import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:csm/screens/components/rounded_button.dart';
import 'package:csm/screens/components/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'navihome.dart';

class AnmeldenScreen extends StatefulWidget {
  @override
  _AnmeldenScreenState createState() => _AnmeldenScreenState();
}

final GoogleSignIn googleSignIn = GoogleSignIn();

class _AnmeldenScreenState extends State<AnmeldenScreen> {
  String _email, _password;
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
                  'Anmelden',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
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
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                  obscureText: true,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Passwort',
                    icon: Icon(
                      Icons.lock_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/reset'),
                  child: Text(
                    'Passwort vergessen?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                RoundedButton(
                  title: 'Anmelden',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    auth
                        .signInWithEmailAndPassword(
                            email: _email, password: _password)
                        .then((_) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => NaviHome(),
                        ),
                      );
                    });
                  },
                ),
                SizedBox(height: 8.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.verified_user,
                        color: Colors.white,
                      ),
                      Text(
                        'Ihre Daten werden in keiner Weise weitergegeben',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
