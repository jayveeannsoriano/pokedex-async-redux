import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/state/action/actions.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

/// Get the list of pokemons from pokemon API
class GetPokemonsAction extends LoadingAction {
  static const key = 'get-pokemons-action';

  GetPokemonsAction() : super(actionKey: key);

  @override
  Future<AppState> reduce() async {
    final pokemons = await ApiService().pokemonApi.getPokemonList(offset: pokemonOffSet, limit: pokemonLimit);

    return state.copyWith(pokemons: pokemons);
  }
}

/// Get pokemon details based on name input from pokemon API
class GetPokemonDetailsAction extends LoadingAction {
  static const key = 'get-pokemon-details-action';

  GetPokemonDetailsAction({required this.pokemonName}) : super(actionKey: key);

  final String pokemonName;

  @override
  Future<AppState> reduce() async {
    final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(name: pokemonName);

    return state.copyWith(pokemonDetails: pokemonDetails);
  }
}

/// Clears the state when going back to the Pokemon Overview Page from Pokemon Details Page
class ClearPokemonDetailsAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(pokemonDetails: null);
}
