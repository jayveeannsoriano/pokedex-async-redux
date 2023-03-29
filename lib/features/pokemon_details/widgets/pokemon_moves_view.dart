import 'package:pokedex_async_redux/utils/colors.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/widgets/spacing.dart';
import 'package:pokedex_async_redux/api/model/model.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

class PokemonMovesView extends StatelessWidget {
  const PokemonMovesView({
    required this.moves,
    super.key,
  });

  final List<Moves> moves;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              movesTextLabel,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
        const VerticalSpace(spacing: 20.0),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.5,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: moves.length,
          itemBuilder: (context, index) {
            final move = moves[index].move;
            return Chip(
              backgroundColor: movesChipBackgroundColor,
              labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              label: FractionallySizedBox(
                widthFactor: 0.94,
                child: Text(move.name.capitalize()),
              ),
            );
          },
        )
      ],
    );
  }
}
