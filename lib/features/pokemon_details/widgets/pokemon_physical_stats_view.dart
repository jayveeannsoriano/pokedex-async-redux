import 'package:pokedex_async_redux/features/pokemon_details/widgets/physical_stats_item.dart';
import 'package:pokedex_async_redux/utils/colors.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:flutter/material.dart';

class PokemonPhysicalStatsView extends StatelessWidget {
  const PokemonPhysicalStatsView({
    required this.pokemonHeight,
    required this.pokemonWeight,
    required this.pokemonBaseExp,
    Key? key,
  }) : super(key: key);

  final String pokemonHeight;
  final String pokemonWeight;
  final String pokemonBaseExp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: statsCardBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            offset: Offset(5, 10),
            spreadRadius: -10,
            blurRadius: 10,
            color: statsCardShadowColor,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PhysicalStatsItem(physicalStats: pokemonHeight, statLabel: heightTextLabel),
          PhysicalStatsItem(physicalStats: pokemonWeight, statLabel: weightTextLabel),
          PhysicalStatsItem(physicalStats: pokemonBaseExp, statLabel: baseExpTextLabel),
        ],
      ),
    );
  }
}
