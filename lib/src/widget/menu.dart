// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_bloc.dart';
import 'package:guadaskate/src/config/globals.dart';
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
  Entry("Grupo 1", [Entry("Activity")]),
  Entry("Grupo 2", [
    Entry("Grupo 2.1", [Entry("Members")]),
    Entry("Grupo 2.2", [Entry("Sample page")]),
  ]),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(BuildContext context, Entry root, [int level = 0]) {
    level++;
    if (root.children.isEmpty)
      return ListTile(
        title: Padding(
          padding: EdgeInsets.fromLTRB(5.0 * level, 0, 0, 0),
          child: Text(root.title, style: MainTheme.navMenuTextStyle()),
        ),
        onTap: () {
          _onTapPressed(context, root.title);
        },
      );
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Padding(
        padding: EdgeInsets.fromLTRB(5.0 * level, 0, 0, 0),
        child: Text(root.title, style: MainTheme.navMenuTextStyle()),
      ),
      children:
          root.children.map((m) => _buildTiles(context, m, level)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, entry);
  }

  void _onTapPressed(BuildContext context, String title) {
    PagesPostBloc pagesPostBloc = BlocProvider.of<PagesPostBloc>(context);
    // Process the title to uppercase and replace spaces with dashes
    String id = title.toUpperCase().replaceAll(' ', '-');
    pagesPostBloc.onGetPage(Global.typePage, id);
    Navigator.pop(context);
  }
}
