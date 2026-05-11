import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final String label;
  final String value;
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
      value,
      style: textTheme.titleMedium,
      // style: TextStyle(
      //   fontSize: 20,
      //   fontWeight: FontWeight.bold,
      //   color: Colors.black,
    );
  }

  Column _column(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleContainer(),
        const SizedBox(
          width: 4,
        ),
        _columnText(textTheme),
      ],
    );
  }

  Row _row() {
    return Row(
      children: [
        Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            )),
      ],
    );
  }

  Container _titleContainer() {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: dotColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

// style: TextStyle(
//   fontSize: 11,
//   fontWeight: FontWeight.w500,
// ),

//OLD
// Text _columnText() {
//   return Text("R\$ ${value.toStringAsFixed(2)}",
//       style: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//         color: Colors.black,
//       ));
// }
