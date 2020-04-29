import 'package:reduxtodolist/model/model.dart';

class AddItemAcction {
  static int _id = 0;
  final String item;

  AddItemAcction(this.item) {
    _id++;
  }

  int get id => _id;

}

class RemoveItemAction {
  final Item item;
  RemoveItemAction(this.item);
}

class RemoveItemsAction { }

class GetItemsAction { }

class LoadedItemsAction { 
  final List<Item> items;
  LoadedItemsAction(this.items);
}


class ItemCompletedAction {
  final Item item;

  ItemCompletedAction(this.item);

}