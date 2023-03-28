import 'package:pokedex_async_redux/features/pokemon_details/widgets/widgets.dart';
import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PokemonDetailsOverview extends StatelessWidget {
  const PokemonDetailsOverview({
    Key? key,
    required this.pokemonName,
    required this.pokemonImage,
    required this.pokemonDetails,
  }) : super(key: key);

  final String pokemonName;
  final String pokemonImage;
  final PokemonDetails pokemonDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PokemonProfileCard(pokemonName: pokemonName, pokemonImage: pokemonImage),
        const VerticalSpace(spacing: 20.0),
        PokemonAbilitiesList(abilities: pokemonDetails.abilities),
        const VerticalSpace(spacing: 25.0),
        PokemonPhysicalStats(physicalStats: pokemonDetails),
        const VerticalSpace(spacing: 25.0),
        PokemonStatsList(stats: pokemonDetails.stats),
        const VerticalSpace(spacing: 30.0),
        PokemonMovesList(moves: pokemonDetails.moves)
      ],
    );
  }
}
