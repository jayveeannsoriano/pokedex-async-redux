import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/widgets/pokemon_tile_card.dart';
import 'package:flutter/material.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    super.key,
    required this.pokemons,
  });

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: pokemonOverviewTitle,
        ),
        body: GridView.builder(
          padding: gridViewPadding,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: gridCount),
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            return PokemonTileCard(pokemon: pokemon);
          },
        ),
      ),
    );
  }
}
