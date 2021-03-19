import 'package:flutter/material.dart';

import 'package:csm/screens/components/web_view_container.dart';

class Bible extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewContainer(
          'https://www.bible.com/de/bible/157/GEN.1.SCH2000', 'Bible'),
    );
  }
}
