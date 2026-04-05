import 'dart:async';

import 'package:finance_tracker/features/metrics/providers/metrics_provider.dart';
import 'package:finance_tracker/features/metrics/viewmodels/metrics_viewmodel.dart';
import 'package:finance_tracker/features/transactions/providers/transaction_notifier.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceChart extends ConsumerWidget {
  const BalanceChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.read => gets the value once and never listens for changes
    //ref.watch => listens to it all the time.
    var metricsAsync = ref.watch(metricsProvider);

    return metricsAsync.when(
      data: (data) => SingleChildScrollView(child: _column(data)),
      error: (e, _) => Text("Deu merda aq paizao"),
      loading: () => const CircularProgressIndicator(),
    );
  }

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

  Column _column(List<MetricsViewmodel> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _text(),
        const SizedBox(height: 4),
        _legend(),
        SizedBox(
          height: 230,
          child: BarChart(_buildChart(data)),
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
        const SizedBox(height: 16),
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

  BarChartData _buildChart(List<MetricsViewmodel> data) {
    return BarChartData(
        gridData: gridData(),
        borderData: FlBorderData(show: false),
        titlesData: titleData(),
        barGroups: _buildBarGroups(data),
        barTouchData: _barTouchData());
  }

  FlTitlesData titleData() {
    var sideTitles = SideTitles(showTitles: false);
    var axis = AxisTitles(sideTitles: sideTitles);

    var bottomTitle = AxisTitles(
        sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 24,
      getTitlesWidget: _bottomTitle,
    ));

    return FlTitlesData(
        leftTitles: axis,
        rightTitles: axis,
        topTitles: axis,
        bottomTitles: bottomTitle);
  }

  Widget _bottomTitle(double value, TitleMeta meta) {
    return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(
          months[value.toInt()],
          style: const TextStyle(fontSize: 11, color: Colors.black),
        ));
  }

  FlGridData gridData() {
    FlLine getDrawingHorizontalLine(value) => FlLine(
          color: Colors.grey.withValues(alpha: 0.15),
          strokeWidth: 1,
        );
    return FlGridData(
      show: true,
      drawVerticalLine: false,
      getDrawingHorizontalLine: getDrawingHorizontalLine,
    );
  }

  ///refactor this please
  List<BarChartGroupData>? _buildBarGroups(List<MetricsViewmodel> data) {
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
