import 'package:flutter/material.dart';
import 'package:csm/screens/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
                    'Herzlich Willkommen',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'bei CSM!',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton(
                title: 'Anmelden',
                colour: Colors.lightBlueAccent,
                onPressed: () {},
              ),
              RoundedButton(
                title: 'Registrieren',
                colour: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, '/register_screen');
                },
              ),
            ]),
      ),
    );
  }
}
