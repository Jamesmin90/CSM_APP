import 'package:flutter/material.dart';
import 'package:csm/screens/components/rounded_button.dart';
import 'package:csm/screens/components/constants.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                    //Do something with the user input.
                  },
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
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Passwort',
                      icon: Icon(
                        Icons.lock_outlined,
                        color: Colors.white,
                      )),
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
                  onPressed: () {},
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
