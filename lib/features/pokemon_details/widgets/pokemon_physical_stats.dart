import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/utils/utils.dart';
import 'package:pokedex_async_redux/widgets/spacing.dart';
import 'package:flutter/material.dart';

class PokemonPhysicalStats extends StatelessWidget {
  const PokemonPhysicalStats({
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
          PhysicalStatsColumn(physicalStats: '${physicalStats.height}', statLabel: heightTextLabel),
          PhysicalStatsColumn(physicalStats: '${physicalStats.weight}', statLabel: weightTextLabel),
          PhysicalStatsColumn(physicalStats: '${physicalStats.baseExperience}', statLabel: baseExpTextLabel),
        ],
      ),
    );
  }
}

class PhysicalStatsColumn extends StatelessWidget {
  const PhysicalStatsColumn({
    required this.physicalStats,
    required this.statLabel,
    Key? key,
  }) : super(key: key);

  final String physicalStats;
  final String statLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          physicalStats,
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpace(spacing: 10.0),
        Text(statLabel, style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}
