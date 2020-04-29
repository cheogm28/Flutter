import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:reduxtodolist/model/model.dart';
import 'package:reduxtodolist/redux/reducer.dart';
import 'package:reduxtodolist/redux/middleware/middleware.dart';

import 'package:reduxtodolist/views/home_view.dart';


void main() => runApp(MyApp(Store<AppState>(
      appStateReducer,
      middleware: appStateMiddleware(new AppState(items: [])),
      initialState: AppState.initialState(),
    )));

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  // This widget is the root of your application.

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Redux Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Redux Demo List'),
        ));
  }
}


