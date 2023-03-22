import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: This is an alternative approach for connector. This will be replaced later
    StoreProvider.dispatch<AppState>(context, GetPokemonsAction());

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AppBar(
        title: const Text('Homepage'),
      ),
    );
  }
}
