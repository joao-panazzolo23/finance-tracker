import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinanceHeader extends StatelessWidget {
  final String totalBalance;
  final String period;

  const FinanceHeader({
    super.key,
    required this.totalBalance,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _leftColumn(colorScheme, textTheme),


      ],
    );

    // TODO: implement build
    // TODO: implement build
    throw UnimplementedError();
  }

  Column _leftColumn(ColorScheme colorScheme, TextTheme textTheme) {
    var spacing = const SizedBox(
      height: 2,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('visão geral',
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            )),
        spacing
      ],
    );
  }
}
