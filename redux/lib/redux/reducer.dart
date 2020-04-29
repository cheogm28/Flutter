import 'package:reduxtodolist/model/model.dart';
import 'actions.dart';
import 'package:redux/redux.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    items: itemReducer(state.items, action),
  );
}

Reducer<List<Item>> itemReducer =  combineReducers<List<Item>>([
      TypedReducer<List<Item>, AddItemAcction>(addItemReducer),
      TypedReducer<List<Item>,RemoveItemAction>(removeitemReducer),
      TypedReducer<List<Item>, RemoveItemsAction>(removeItemsReducer),
      TypedReducer<List<Item>, LoadedItemsAction>(loadItemsReducer),
      TypedReducer<List<Item>, ItemCompletedAction>(itemCompletedReducer),
]);


List<Item> addItemReducer(List<Item> items, AddItemAcction action){
  return []
    ..addAll(items)
    ..add(Item(id: action.id, body: action.item));
}

List<Item> removeitemReducer(List<Item> state,RemoveItemAction action){
      return List.unmodifiable(state.toList()..remove(action.item));
}

List<Item> removeItemsReducer(List<Item> state, RemoveItemsAction action){
    return List.unmodifiable([]);
}

List<Item> loadItemsReducer(List<Item> items, LoadedItemsAction action ){
    return action.items;

}

List<Item> itemCompletedReducer(List<Item> items, ItemCompletedAction action ){
    return items.map((item)=>item.id == action.item.id
    ? item.copyWith(completed: !item.completed)
    : item)
    .toList();

}


// List<Item> itemReducer(List<Item> state, action) {
//   if (action is AddItemAcction) {
//     return []
//       ..addAll(state)
//       ..add(Item(id: action.id, body: action.item));
//   }

//   if (action is RemoveItemAction) {
//     return List.unmodifiable(state.toList()..remove(action.item));
//   }

//   if (action is RemoveItemsAction) {
//     return List.unmodifiable([]);
//   }

//   if (action is LoadedItemsAction) {
//     return action.items;
//   }

//   return state;
// }
