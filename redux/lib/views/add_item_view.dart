import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxtodolist/redux/actions.dart';
import 'package:reduxtodolist/model/model.dart';
import 'package:redux/redux.dart';

class AddItemWidget extends StatefulWidget {
  AddItemWidget();

  @override
  State<StatefulWidget> createState() => _AddItemState();
}

class _AddItemState extends State<AddItemWidget> {
  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextField createTextFile(Function callback) {
      return TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "add an Item"),
          onSubmitted: (String s) {
            callback(AddItemAcction(s));
            controller.text = "";
          });
    }

    return StoreConnector<AppState, Function>(
      builder: (BuildContext context, vm) => createTextFile(vm),
      converter: (Store<AppState> store) => store.dispatch,
    );
  }
}
