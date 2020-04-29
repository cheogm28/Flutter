import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:reduxtodolist/model/model.dart';
import 'package:reduxtodolist/redux/actions.dart';

void saveToPreferences(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String jsonState = json.encode(state.toJson());
  await preferences.setString("itemsState", jsonState);
}

Future<AppState> loadFromPreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String jsonState = preferences.getString("itemsState");
  Map stateMap = json.decode(jsonState);
  return stateMap.isEmpty
      ? AppState.initialState()
      : AppState.fromJson(stateMap);
}

Middleware<AppState> _loadFromPreferences(AppState state) {
  //retorna el signature de middleware
  return (Store<AppState> store, action, NextDispatcher nextDispatcher) {
    nextDispatcher(action);

    loadFromPreferences()
        .then((state) => store.dispatch(LoadedItemsAction(state.items)));
  };
}

Middleware<AppState> _saveToPreferences(AppState state) {
  return (Store<AppState> store, action, NextDispatcher nextDispatcher) {
    nextDispatcher(action);

    saveToPreferences(store.state);
  };
}

List<Middleware<AppState>> appStateMiddleware([AppState state]) {
  final loadItems = _loadFromPreferences(state);
  final saveItems = _saveToPreferences(state);

  return [
    TypedMiddleware<AppState, AddItemAcction>(saveItems),
    TypedMiddleware<AppState, RemoveItemAction>(saveItems),
    TypedMiddleware<AppState, RemoveItemsAction>(saveItems),
    TypedMiddleware<AppState, GetItemsAction>(loadItems),
        TypedMiddleware<AppState, ItemCompletedAction>(saveItems),

  ];
}
