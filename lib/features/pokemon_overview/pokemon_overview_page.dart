import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/utils/async.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/widgets/pokemon_tile_card.dart';
import 'package:flutter/material.dart';

final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    super.key,
  });

  final Async<List<Pokemon>> pokemons;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldKey,
      home: Scaffold(
        appBar: AppBar(title: const Text(pokemonOverviewTitle)),
        body: pokemons.when(
          (data) => GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: data.length,
            itemBuilder: (_, index) {
              final pokemon = data[index];
              return PokemonTileCard(pokemon: pokemon);
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (errorMessage) {
            SnackBar snackBar = _showErrorMessageSnackbar(errorMessage);
            _scaffoldKey.currentState?.showSnackBar(snackBar);
            return const Center(child: Text(emptyPokemonsLabel));
          },
        ),
      ),
    );
  }

  SnackBar _showErrorMessageSnackbar(String? errorMessage) => SnackBar(content: Text(errorMessage!));
}
