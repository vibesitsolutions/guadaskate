import 'package:flutter/material.dart';
import 'package:guadaskate/src/lang/lang_localizations.dart';
import 'package:guadaskate/src/ui/language_selector_page.dart';
import 'package:guadaskate/src/ui/page_page.dart';
import 'package:guadaskate/src/widget/drawer.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}


class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(LangLocalizations.of(context).title),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.language),
                onPressed: () => _onLanguagePressed(context),
                tooltip: "Idioma",
              ),
              IconButton(
                icon: Icon(Icons.input),
                onPressed: _onLoginPressed,
                tooltip: "Iniciar sesion",
              ),
            ],
          ),
          drawer: MyDrawer(),
          body: PagePage(),
        ),
      );
  }

  void _onLanguagePressed(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return LanguageSelectorPage();
      })
    );
  }

  void _onLoginPressed() {}

}
