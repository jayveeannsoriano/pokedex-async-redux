import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/home_page.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

//TODO: Future added for debugging. This will be removed
Future<void> main() async {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

  //TODO: Added for debugging. This will be removed
  final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(name: 'jigglypuff');
  pokemonDetails;

  runApp(
    StoreProvider(
      store: store,
      child: const MaterialApp(
        //TODO: 'Home Page' would be placed in a constant file
        title: 'Home Page',
        home: HomePage(),
      ),
    ),
  );
}
