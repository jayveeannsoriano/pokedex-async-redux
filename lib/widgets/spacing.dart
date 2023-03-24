import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({
    Key? key,
    required this.spacing,
  }) : super(key: key);

  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spacing);
  }
}
