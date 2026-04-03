import 'package:flutter/cupertino.dart';

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
      padding: EdgeInsets.all(16),
      decoration: boxDecoration(),
      child: column(),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: color.withValues(),
      borderRadius: BorderRadius.circular(12),
    );
  }

  Text columnText() {
    return Text("R\$ ${value.toStringAsFixed(2)}",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color,
        ));
  }

  Column column() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(),
        columnText(),
      ],
    );
  }
}
