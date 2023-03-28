import 'package:dartx/dartx.dart';
import 'package:pokedex_async_redux/api/model/abilities.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utils/color_constants.dart';
import 'package:pokedex_async_redux/utils/constants.dart';

class PokemonAbilitiesList extends StatelessWidget {
  const PokemonAbilitiesList({
    required this.abilities,
    Key? key,
  }) : super(key: key);

  final List<Abilities> abilities;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: abilities
          .map(
            (ability) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Chip(
                avatar: const CircleAvatar(
                  backgroundColor: abilityChipIconBackgroundColor,
                  backgroundImage: NetworkImage(abilityChipIconImagePath),
                ),
                label: Text(ability.ability?.name.capitalize() ?? emptyString),
              ),
            ),
          )
          .toList(),
    );
  }
}
