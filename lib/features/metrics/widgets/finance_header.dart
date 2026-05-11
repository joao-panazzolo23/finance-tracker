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
        _container(colorScheme),
      ],
    );
  }

  Container _container(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outlineVariant,
          width: 0.5,
        ),
      ),
      child: _containerRow(colorScheme),
    );
  }

  Row _containerRow(ColorScheme colorScheme) {
    var spacing = const SizedBox(
      width: 4,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.calendar_today_outlined,
          size: 14,
          color: colorScheme.onSurfaceVariant,
        ),
        spacing,
        Text("maio 2025")
      ],
    );
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
        spacing,
        Text(
          totalBalance,
          style:
              textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        spacing,
        Text(
          period,
          style: textTheme.labelSmall
              ?.copyWith(color: colorScheme.onSurfaceVariant),
        )
      ],
    );
  }
}
