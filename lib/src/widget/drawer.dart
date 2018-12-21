import 'package:flutter/material.dart';
import 'package:guadaskate/src/theme/main_theme.dart';

class MyDrawer extends StatelessWidget {
  final Map<String, dynamic> sectionList = {
    "EL CLUB": {
      "La historia": [],
      "Funcionamiento interno": {
        "Normas deportivas de régimen interno": null,
      },
      "Recursos técnicos": [
        "Pruebas e integrativos",
        "Archivos Digitales",
        "Eventos 2015",
        "Album de fotos – Beta",
      ],
      "Contacto": [],
    },
    "SHOW": {
      "Coreografías": [
        "2015 – Vuelve",
      ],
    },
    "NOTICIAS": [],
    "PATINAR EN GUADALAJARA": {
      "Escuela de Patinaje Artístico de Fontanar": [
        "Historia de la E.P.A. de Fontanar",
        "Solicitud de Plaza 2018/19 EPA Fontanar",
      ],
      "Escuela de patinaje de Guadalajara": {
        "Curso 2018-19": [
          "Inscripción Parque de La Muñeca 2018-19",
          "Inscripción CP Río Henares 2018-19",
          "Solicitud de plaza 2018-19",
        ]
      }
    }
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          Container(
            child: Text("Bienvenidos Guadalajara Show", style: MainTheme.textStyle()),
            decoration: BoxDecoration(color: Colors.pink),
            padding: EdgeInsets.all(20.0),
          ),
          ListTile(
            leading: Icon(Icons.new_releases),
            title: Text('Nuevas noticias'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.forum),
            title: Text('Foro'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Iniciar Sesion'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
        ],
      ),
    );
  }
}
