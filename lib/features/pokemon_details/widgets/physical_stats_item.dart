import 'package:pokedex_async_redux/widgets/spacing.dart';
import 'package:flutter/material.dart';

class PhysicalStatsItem extends StatelessWidget {
  const PhysicalStatsItem({
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
