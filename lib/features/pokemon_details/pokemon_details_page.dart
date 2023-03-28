import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/features/pokemon_details/widgets/widgets.dart';
import 'package:pokedex_async_redux/utils/utils.dart';
import 'package:flutter/material.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    required this.pokemonDetails,
    required this.pokemonName,
    required this.pokemonImage,
    super.key,
  });

  final Async<PokemonDetails> pokemonDetails;
  final String pokemonName;
  final String pokemonImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(pokemonDetailsTitle)),
      body: pokemonDetails.when(
        (data) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: PokemonDetailsOverview(
              pokemonName: pokemonName,
              pokemonImage: pokemonImage,
              pokemonDetails: data,
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (errorMessage) {
          WidgetsBinding.instance.addPostFrameCallback((_) => _showErrorMessageSnackbar(context, errorMessage));
          return const Center(child: Text(emptyPokemonDetailsLabel));
        },
      ),
    );
  }

  _showErrorMessageSnackbar(BuildContext context, String? errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage ?? emptyString)),
    );
  }
}
