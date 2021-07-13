import 'package:flutter/material.dart';

import 'package:csm/screens/components/web_view_container.dart';

class About1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewContainer('https://csmuenchen.de/ueber-uns/', 'Über Uns'),
    );
  }
}
