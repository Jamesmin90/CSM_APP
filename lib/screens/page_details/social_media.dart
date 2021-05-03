import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatelessWidget {
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'Info@CSM.de',
      queryParameters: {'subject': 'Hallo CSM!'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Media"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              onTap: () async {
                launch(_emailLaunchUri.toString());
              },
              leading: Image.asset('assets/images/gmail.png'),
              title: Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              subtitle: Text(
                "Info@CSM.de",
                style: TextStyle(fontSize: 17),
              ),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () async {
                const url =
                    "https://www.facebook.com/pages/category/Assemblies-of-God/Christliche-Studenten-in-München-106086651383691/";
                if (await canLaunch(url)) {
                  await launch(Uri.encodeFull(url), forceSafariVC: false);
                } else {
                  throw 'Could not launch $url';
                }
              },
              leading: Image.asset('assets/images/facebook.png'),
              title: Text(
                "Facebook",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              subtitle: Text(
                "Christliche Studenten in München",
                style: TextStyle(fontSize: 17),
              ),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () async {
                const url =
                    "https://www.instagram.com/christianstudentsmunich/";
                if (await canLaunch(url)) {
                  await launch(url, forceSafariVC: false);
                } else {
                  throw 'Could not launch $url';
                }
              },
              leading: Image.asset('assets/images/instagram.png'),
              title: Text(
                "Instagram",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              subtitle: Text("@christianstudentsmunich",
                  style: TextStyle(fontSize: 17)),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () async {
                const url = "https://www.csmuenchen.de";
                if (await canLaunch(url)) {
                  await launch(url, forceSafariVC: false);
                } else {
                  throw 'Could not launch $url';
                }
              },
              leading: Image.asset('assets/images/chrome.png'),
              title: Text(
                "Website",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              subtitle: Text("https://www.csmuenchen.de",
                  style: TextStyle(fontSize: 17)),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () async {
                const url = "https://www.csmuenchen.de/contact-us";
                if (await canLaunch(url)) {
                  await launch(url, forceSafariVC: false);
                } else {
                  throw 'Could not launch $url';
                }
              },
              leading: Image.asset('assets/images/csm_logo.png'),
              title: Text(
                "Contact us",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              subtitle: Text(" ", style: TextStyle(fontSize: 17)),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
        ],
      ),
    );
  }
}
