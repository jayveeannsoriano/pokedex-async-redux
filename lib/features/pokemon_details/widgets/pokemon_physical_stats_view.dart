import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/features/pokemon_details/widgets/physical_stats_item.dart';
import 'package:pokedex_async_redux/utils/colors.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:flutter/material.dart';

class PokemonPhysicalStatsView extends StatelessWidget {
  const PokemonPhysicalStatsView({
    required this.physicalStats,
    Key? key,
  }) : super(key: key);

  final PokemonDetails physicalStats;

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
          PhysicalStatsItem(physicalStats: '${physicalStats.height}', statLabel: heightTextLabel),
          PhysicalStatsItem(physicalStats: '${physicalStats.weight}', statLabel: weightTextLabel),
          PhysicalStatsItem(physicalStats: '${physicalStats.baseExperience}', statLabel: baseExpTextLabel),
        ],
      ),
    );
  }
}
