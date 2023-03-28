import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details.dart';
import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/utils/utils.dart';
import 'package:pokedex_async_redux/widgets/widgets.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

class PokemonTileCard extends StatelessWidget {
  const PokemonTileCard({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final pokemonId = pokemon.url.split(urlSplitter)[idIndex];
    final pokemonImageUrl = pokemonImageUrlPath.replaceAll(indexKey, pokemonId);
    final pokemonName = pokemon.name.capitalize();

    return GestureDetector(
      onTap: () => _navigateToPokemonDetailsPage(context, pokemonImageUrl),
      child: Column(
        children: [
          SizedBox(
            width: imageWidth,
            height: imageHeight,
            child: Image.network(pokemonImageUrl),
          ),
          const VerticalSpace(spacing: gridContentSpacing),
          Text(pokemonName),
        ],
      ),
    );
  }

  _navigateToPokemonDetailsPage(BuildContext context, String pokemonImageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PokemonDetailsConnector(
          pokemonName: pokemon.name,
          pokemonImage: pokemonImageUrl,
        ),
      ),
    );
  }
}
