import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

/// Get the list of pokemons from pokemon API
class GetPokemonsAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final pokemons = await ApiService().pokemonApi.getPokemonList(offset: pokemonOffSet, limit: pokemonLimit);

    return state.copyWith(pokemons: pokemons);
  }
}

/// Get pokemon details based on name input from pokemon API
class GetPokemonDetailsAction extends ReduxAction<AppState> {
  GetPokemonDetailsAction({required this.pokemonName});

  final String pokemonName;

  @override
  Future<AppState> reduce() async {
    final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(name: pokemonName);

    return state.copyWith(pokemonDetails: pokemonDetails);
  }
}
