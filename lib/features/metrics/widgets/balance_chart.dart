import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BalanceChart extends StatelessWidget {
  const BalanceChart({super.key});

  static final data = [
    (income: 3800.0, expense: 2600.0),
    (income: 3500.0, expense: 2900.0),
    (income: 4200.0, expense: 2800.0),
    (income: 3900.0, expense: 3100.0),
    (income: 4500.0, expense: 2700.0),
    (income: 4200.0, expense: 2800.0),
  ];

  static const List<String> months = [
    "Jan",
    "Fev",
    "Mar",
    "Abr",
    "Mai",
    "Jun",
    "Jul",
    "Ago",
    "Set",
    "Out",
    "Nov",
    "Dez",
  ];

  @override
  Widget build(BuildContext context) {
    return _column();
  }

  Column _column() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _text(),
        const SizedBox(
          height: 4,
        ),
        _legend(),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Text _text() {
    return const Text(
      "Saldo",
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _legend() {
    return Row(
      children: [
        _legendItem(color: Colors.green, label: "Entradas"),
        const SizedBox(
          height: 16,
        ),
        _legendItem(color: Colors.redAccent, label: "Saídas"),
      ],
    );
  }

  Widget _legendItem({required Color color, required String label}) {
    return Row(
      children: [
        _container(color),
        const SizedBox(width: 5),
        _legendText(label),
      ],
    );
  }

  Text _legendText(String label) {
    return Text(
      label,
      style: TextStyle(fontSize: 12, color: Colors.grey),
    );
  }

  Widget _container(Color color) {
    return Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
        ));
  }

  BarChartData _buildChart() {
    return BarChartData(
        gridData: gridData(),
        borderData: FlBorderData(show: false),
        titlesData: titleData(),
        barGroups: _buildBarGroups(),
        barTouchData: _barTouchData());
  }

  FlTitlesData titleData() {
    var sideTitles = SideTitles(showTitles: false);
    var axis = AxisTitles(sideTitles: sideTitles);

    return FlTitlesData(
        leftTitles: axis,
        rightTitles: axis,
        topTitles: axis,
        bottomTitles: axis);
  }

  Widget _bottomTitle(int value, TitleMeta meta) {
    return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(
          months[value],
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ));
  }

  FlGridData gridData() {
    return FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.grey.withValues(alpha: 0.15),
              strokeWidth: 1,
            ));
  }

  ///omg
  List<BarChartGroupData>? _buildBarGroups() {
    return data.indexed.map((entry) {
      final i = entry.$1;
      final d = entry.$2;
      return BarChartGroupData(
        x: i,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: d.income,
            color: Colors.green,
            width: 10,
            borderRadius: BorderRadius.circular(4),
          ),
          BarChartRodData(
            toY: d.expense,
            color: Colors.redAccent,
            width: 10,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    }).toList();
  }

  BarTouchData? _barTouchData() {
    return BarTouchData(
        touchTooltipData: BarTouchTooltipData(getTooltipItem: _toolTipData));
  }

  BarTooltipItem _toolTipData(
    BarChartGroupData group,
    int groupIndex,
    BarChartRodData rod,
    int rodIndex,
  ) {
    var type = "Entradas";

    if (rodIndex == 0) {
      type = "Saídas";
    }

    return BarTooltipItem(
      "$type\nR\$ ${rod.toY.toStringAsFixed(2)}",
      const TextStyle(color: Colors.white, fontSize: 12),
    );
  }
}
