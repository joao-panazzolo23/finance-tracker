import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MetricCard extends StatelessWidget {
  final String label;
  final double value;
  final String trend;
  final bool isPositive;
  final Color dotColor;

  const MetricCard({
    super.key,
    required this.label,
    required this.dotColor,
    required this.value,
    required this.isPositive,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(12),
      decoration: _boxDecoration(colorScheme),
      child: _column(textTheme),
    );
  }

  BoxDecoration _boxDecoration(ColorScheme colorScheme) {
    return BoxDecoration(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: colorScheme.outlineVariant,
      ),
    );
  }

  Text _columnText(TextTheme textTheme) {
    return Text(
      NumberFormat.currency(
        locale: 'pt_BR',
        symbol: 'R\$',
      ).format(value),
      style: textTheme.titleMedium,
    );
  }

  Column _column(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleContainer(textTheme),
        const SizedBox(
          width: 4,
        ),
        _columnText(textTheme),
      ],
    );
  }

  Row _titleContainer(TextTheme textTheme) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
