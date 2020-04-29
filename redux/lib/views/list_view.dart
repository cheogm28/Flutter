import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxtodolist/redux/actions.dart';
import 'package:reduxtodolist/model/model.dart';
import 'package:redux/redux.dart';

class ItemListWidget extends StatelessWidget {
  ItemListWidget();

  @override
  Widget build(BuildContext context) {
    ListView createListView(List<Item> items) {
      return ListView(
          children: items
              .map((Item item) => ListTile(
                  title: Text(item.body),
                  leading: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => StoreProvider.of<AppState>(context)
                        .dispatch(RemoveItemAction(item)),
                  ),
                  trailing: Checkbox(
                      value: item.completed,
                      onChanged: (b) => StoreProvider.of<AppState>(context)
                          .dispatch(ItemCompletedAction(item)))))
              .toList());
    }

    /*
        converter: (Store<AppState> store) => store.state.items,
        builder: (BuildContext context, List vm) => createListView(vm)*/
    return new StoreBuilder<AppState>(
      onInit: (store) => store.dispatch(GetItemsAction()),
      builder: (BuildContext context, Store vm) =>
          createListView(StoreProvider.of<AppState>(context).state.items),
    );
  }
}
