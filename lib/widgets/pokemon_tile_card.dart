import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
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
    final pokemonId = pokemon.url.split(urlSplitter)[idIndex];
    final pokemonImageUrl = pokemonImageUrlPath.replaceAll(indexKey, pokemonId);
    final pokemonName = pokemon.name.capitalize();

    return Column(
      children: [
        SizedBox(
          width: imageWidth,
          height: imageHeight,
          child: Image.network(pokemonImageUrl),
        ),
        const VerticalSpace(spacing: gridContentSpacing),
        Text(pokemonName),
      ],
    );
  }
}
