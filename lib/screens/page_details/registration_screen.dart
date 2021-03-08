import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:csm/screens/components/rounded_button.dart';
import 'package:csm/screens/components/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'navihome.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                  'Registrierung',
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
                SizedBox(height: 8.0),
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Name',
                      icon: Icon(
                        Icons.supervised_user_circle_outlined,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'registrieren',
                  colour: Colors.blueAccent,
                  onPressed: () => _signup(_email, _password),
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

  _signup(String _email, String _password) async {
    try {
      //Create Get Firebase Auth User
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);

      //Success
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => NaviHome()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
        msg: error.message,
        gravity: ToastGravity.TOP,
      );
    }
  }
}
//   _signInWithGoogle() async {
//     final GoogleSignInAccount googleUser = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//         idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

//     final FirebaseUser user =
//         (await firebaseAuth.signInWithCredential(credential)).user;
//   }
// }
