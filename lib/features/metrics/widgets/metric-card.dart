import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({
    super.key,
    required this.title,
    required this.color,
    required this.value,
  });

  final String title;
  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: _boxDecoration(),
      child: _column(),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: color.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: color.withValues(alpha: 0.2)),
    );
  }

  Text _columnText() {
    return Text("R\$ ${value.toStringAsFixed(2)}",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ));
  }

  Column _column() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        SizedBox(),
        _columnText(),
      ],
    );
  }

  Text _title() {
    return Text(
      title,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
