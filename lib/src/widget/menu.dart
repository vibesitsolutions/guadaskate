// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:guadaskate/src/theme/main_theme.dart';

class NavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
      itemCount: data.length,
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const []]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List data = [
  Entry(
    'El club',
    [
      Entry('La historia'),
      Entry(
        'Funcionamiento interno',
        [
          Entry('Normas deportivas de régimen interno'),
        ],
      ),
      Entry('Recursos técnicos', [
        Entry('Pruebas e integrativos'),
        Entry('Archivos Digitales'),
        Entry('Eventos 2015'),
        Entry('Album de fotos – Beta'),
      ]),
      Entry('Contacto')
    ],
  ),
  Entry(
    'Show',
    [
      Entry('Coreografías', [Entry('2015 – Vuelve')]),
    ],
  ),
  Entry('Noticias'),
  Entry(
    'Patinar en Guadalajara',
    [
      Entry(
        'Escuela de Patinaje Artístico de Fontanar',
        [
          Entry('Historia de la E.P.A. de Fontanar'),
          Entry('Solicitud de Plaza 2018/19 EPA Fontanar'),
        ],
      ),
      Entry(
        'Escuela de patinaje de Guadalajara',
        [
          Entry(
            'Curso 2018-19',
            [
              Entry('Inscripción Parque de La Muñeca 2018-19'),
            ],
          ),
        ],
      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root, [int level = 0]) {
    level++;
    if (root.children.isEmpty)
      return ListTile(
        title: Padding(
          padding: EdgeInsets.fromLTRB(5.0 * level, 0, 0, 0),
          child: Text(root.title, style: MainTheme.navMenuTextStyle()),
        ),
      );
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Padding(
        padding: EdgeInsets.fromLTRB(5.0 * level, 0, 0, 0),
        child: Text(root.title, style: MainTheme.navMenuTextStyle()),
      ),
      children: root.children.map((m) => _buildTiles(m, level)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
