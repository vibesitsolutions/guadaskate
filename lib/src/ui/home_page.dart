import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebviewScaffold(

        url: "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv:OJ.L_.2017.312.01.0006.01.ENG&toc=OJ:L:2017:312:TOC#d1e259-6-1",
      ),
    );
  }
}
