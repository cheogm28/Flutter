import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxtodolist/redux/actions.dart';
import 'package:reduxtodolist/model/model.dart';

class RemoveItemsButton extends StatelessWidget {
  RemoveItemsButton();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Delete all"),
      onPressed: () => StoreProvider.of<AppState>(context).dispatch(RemoveItemsAction()),
    );
  }
}