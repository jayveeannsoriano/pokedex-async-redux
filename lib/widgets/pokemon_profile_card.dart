import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/utils/string_extensions.dart';
import 'package:pokedex_async_redux/widgets/spacing.dart';
import 'package:flutter/material.dart';

class PokemonProfileCard extends StatelessWidget {
  const PokemonProfileCard({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          pokemon.name.toUpperCase(),
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 200.0,
          child: Image.network(pokemon.url.toPokemonImageUrl),
        ),
        const VerticalSpace(spacing: 30.0),
      ],
    );
  }
}
