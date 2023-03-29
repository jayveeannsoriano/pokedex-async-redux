import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details_page.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details_vm.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

class PokemonDetailsConnector extends StatelessWidget {
  const PokemonDetailsConnector({
    required this.pokemon,
    super.key,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonDetailsVm>(
      vm: () => PokemonDetailsVmFactory(),
      onInit: (store) => store.dispatchAsync(GetPokemonDetailsAction(pokemonName: pokemon.name)),
      onDispose: (store) => store.dispatchSync(ClearPokemonDetailsAction()),
      builder: (context, vm) => PokemonDetailsPage(
        pokemon: pokemon,
        pokemonDetails: vm.pokemonDetails,
      ),
    );
  }
}
