import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details.dart';
import 'package:pokedex_async_redux/state/state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

class PokemonDetailsConnector extends StatelessWidget {
  const PokemonDetailsConnector({
    required this.pokemonName,
    required this.pokemonImage,
    super.key,
  });

  final String pokemonName;
  final String pokemonImage;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonDetailsVm>(
      vm: () => PokemonDetailsVmFactory(),
      onInit: (store) => store.dispatchAsync(GetPokemonDetailsAction(pokemonName: pokemonName)),
      onDispose: (store) => store.dispatchSync(ClearPokemonDetailsAction()),
      builder: (context, vm) => PokemonDetailsPage(
        pokemonDetails: vm.pokemonDetails,
        pokemonName: pokemonName,
        pokemonImage: pokemonImage,
      ),
    );
  }
}
