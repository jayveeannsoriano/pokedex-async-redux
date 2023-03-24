import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/widgets/pokemon_tile_card.dart';
import 'package:flutter/material.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    super.key,
  });

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text(pokemonOverviewTitle)),
        body: GridView.builder(
          padding: gridViewPadding,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: gridCount),
          itemCount: pokemons.length,
          itemBuilder: (_, index) {
            final pokemon = pokemons[index];
            return PokemonTileCard(pokemon: pokemon);
          },
        ),
      ),
    );
  }
}
