import 'package:pokedex_async_redux/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PokemonProfileCard extends StatelessWidget {
  const PokemonProfileCard({
    Key? key,
    required this.pokemonName,
    required this.pokemonImage,
  }) : super(key: key);

  final String pokemonName;
  final String pokemonImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          pokemonName.toUpperCase(),
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 200.0,
          child: Image.network(pokemonImage),
        ),
        const VerticalSpace(spacing: 30.0),
      ],
    );
  }
}
