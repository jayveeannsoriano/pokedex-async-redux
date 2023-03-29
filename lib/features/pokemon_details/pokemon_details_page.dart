import 'package:pokedex_async_redux/features/pokemon_details/widgets/pokemon_abilities_view.dart';
import 'package:pokedex_async_redux/features/pokemon_details/widgets/pokemon_moves_view.dart';
import 'package:pokedex_async_redux/features/pokemon_details/widgets/pokemon_physical_stats_view.dart';
import 'package:pokedex_async_redux/features/pokemon_details/widgets/pokemon_stats_view.dart';
import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/utils/async.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/widgets/pokemon_profile_card.dart';
import 'package:pokedex_async_redux/widgets/spacing.dart';
import 'package:flutter/material.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    required this.pokemon,
    required this.pokemonDetails,
    super.key,
  });

  final Async<PokemonDetails> pokemonDetails;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(pokemonDetailsTitle)),
      body: pokemonDetails.when(
        (data) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                children: [
                  PokemonProfileCard(pokemon: pokemon),
                  const VerticalSpace(spacing: 20.0),
                  PokemonAbilitiesView(abilities: data.abilities),
                  const VerticalSpace(spacing: 25.0),
                  PokemonPhysicalStatsView(physicalStats: data),
                  const VerticalSpace(spacing: 25.0),
                  PokemonStatsView(stats: data.stats),
                  const VerticalSpace(spacing: 30.0),
                  PokemonMovesView(moves: data.moves)
                ],
              )
            ],
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
