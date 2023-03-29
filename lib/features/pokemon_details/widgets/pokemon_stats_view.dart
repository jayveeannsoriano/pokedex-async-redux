import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:pokedex_async_redux/utils/colors.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/widgets/spacing.dart';
import 'package:flutter/material.dart';

class PokemonStatsView extends StatelessWidget {
  const PokemonStatsView({
    required this.stats,
    super.key,
  });

  final List<Stats> stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              statsTextLabel,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
        const VerticalSpace(spacing: 10.0),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stats.length,
          itemBuilder: (context, index) {
            final stat = stats[index].stat;
            final baseStat = stats[index].baseStat;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        stat.name.toUpperCase(),
                        style: const TextStyle(
                          height: 2.5,
                          color: statNameFontColor,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        baseStat.toString(),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
