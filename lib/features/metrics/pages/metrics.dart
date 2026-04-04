import 'package:finance_tracker/features/metrics/widgets/balance_chart.dart';
import 'package:flutter/material.dart';
import '../widgets/metric-card.dart';

class Metrics extends StatelessWidget {
  const Metrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        row(),
        SizedBox(height: 24),
        BalanceChart(),
      ],
    );
  }

  Widget row() {
    var spacing = const SizedBox(
      width: 10,
    );

    return Row(children: [
      income(),
      spacing,
      outcome(),
      spacing,
      saved(),
    ]);
  }

  Widget saved() {
    var card = MetricCard(
      title: "Saldo",
      color: Colors.blue,
      value: 900,
    );
    return Expanded(child: card);
  }

  Widget income() {
    var card = MetricCard(
      title: "Entradas",
      color: Colors.green,
      value: 2000,
    );
    return Expanded(child: card);
  }

  Widget outcome() {
    var card = MetricCard(
      title: "Saídas",
      color: Colors.red,
      value: 2000,
    );
    return Expanded(child: card);
  }
}
