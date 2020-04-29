import 'package:flutter/material.dart';

import 'package:reduxtodolist/views/add_item_view.dart';
import 'package:reduxtodolist/views/list_view.dart';
import 'package:reduxtodolist/views/remove_all_view.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Column(
        children: <Widget>[
          AddItemWidget(),
          Expanded(
            child: ItemListWidget(),
          ),
          RemoveItemsButton()
        ],
      ), 
    );
  }
}