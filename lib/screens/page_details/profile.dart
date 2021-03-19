import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

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
                    'Was möchten Sie gerne in Ihrem Profile machen?',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              profileButton(
                icon: Icons.lock_rounded,
                title: 'Passwort ändern',
                colour: Color.fromRGBO(0, 134, 195, 1),
                onPressed: () {
                  Navigator.pushNamed(context, '/newpass');
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              profileButton(
                icon: Icons.email_rounded,
                title: 'Email-Adresse ändern',
                colour: Color.fromRGBO(41, 182, 246, 1),
                onPressed: () {
                  Navigator.pushNamed(context, '/newemail');
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              profileButton(
                icon: Icons.delete,
                title: 'Email-Adresse ändern',
                colour: Color.fromRGBO(115, 232, 255, 1),
                onPressed: () {
                  Navigator.pushNamed(context, '/delete_user');
                },
              ),
            ]),
      ),
    );
  }

  Widget profileButton({
    @required String title,
    @required IconData icon,
    @required Color colour,
    @required Function onPressed,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          elevation: 5.0,
          color: colour,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200.0,
            height: 50.0,
            child: Row(children: [
              Icon(icon),
              SizedBox(
                width: 10.0,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
            ]),
          ),
        ),
      );
}
