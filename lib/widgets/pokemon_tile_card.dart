import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/utils/string_extensions.dart';
import 'package:pokedex_async_redux/widgets/spacing.dart';
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
    final pokemonName = pokemon.name.capitalize();

    return GestureDetector(
      onTap: () => _navigateToPokemonDetailsPage(context),
      child: Column(
        children: [
          SizedBox(
            width: imageWidth,
            height: imageHeight,
            child: Image.network(pokemon.url.toPokemonImageUrl),
          ),
          const VerticalSpace(spacing: gridContentSpacing),
          Text(pokemonName),
        ],
      ),
    );
  }

  _navigateToPokemonDetailsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PokemonDetailsConnector(pokemon: pokemon),
      ),
    );
  }
}
