import 'package:finance_tracker/features/metrics/providers/metrics_provider.dart';
import 'package:finance_tracker/features/metrics/viewmodels/metrics_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/extensions/date_extensions.dart';

///todo: remove all these colorSchemes and do it globally
class BalanceChart extends ConsumerWidget {
  const BalanceChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.read => gets the value once and never listens for changes
    //ref.watch => listens to it all the time.
    var metrics = ref.watch(getMetricsProvider);
    // var getResumedReview = ref.watch(getResumedReviewProvider);

    return metrics.when(
      data: (data) => SingleChildScrollView(child: _column(data, context)),
      error: (e, _) => Text("Deu merda aq paizao"),
      loading: () => const CircularProgressIndicator(),
    );
  }

  ///todo: pass it to another file
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

  Column _column(List<MetricsViewmodel> data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _text(context),
        const SizedBox(height: 4),
        _legend(),
        SizedBox(
          height: 230,
          child: BarChart(_buildChart(data, context)),
        ),
      ],
    );
  }

  Text _text(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      "Saldo",
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurfaceVariant),
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

  BarChartData _buildChart(List<MetricsViewmodel> data, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BarChartData(
      gridData: _gridData(colorScheme),
      borderData: FlBorderData(show: false),
      titlesData: _titleData(colorScheme),
      barGroups: _buildBarGroups(data),
      barTouchData: _barTouchData(colorScheme),
      maxY: _calcMaxY(data),
    );
  }

  FlTitlesData _titleData(ColorScheme colorScheme) {
    var sideTitles = SideTitles(showTitles: false);
    var axis = AxisTitles(sideTitles: sideTitles);

    var bottomTitle = AxisTitles(
        sideTitles: SideTitles(
      showTitles: true,
      reservedSize: 24,
      getTitlesWidget: (value, meta) => _bottomTitle(value, meta, colorScheme),
    ));

    return FlTitlesData(
        leftTitles: axis,
        rightTitles: axis,
        topTitles: axis,
        bottomTitles: bottomTitle);
  }

  Widget _bottomTitle(double value, TitleMeta meta, ColorScheme colorScheme) {
    final start = monthOffset(DateTime.now(), 11 - value.toInt());

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        months[start.month - 1],
        style: TextStyle(
          fontSize: 11,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  FlGridData _gridData(ColorScheme colorScheme) {
    FlLine getDrawingHorizontalLine(value) => FlLine(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
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

  BarTouchData? _barTouchData(ColorScheme colorScheme) {
    return BarTouchData(
        touchTooltipData: BarTouchTooltipData(
      getTooltipItem: _toolTipData,
    ));
  }

  BarTooltipItem _toolTipData(
    BarChartGroupData group,
    int groupIndex,
    BarChartRodData rod,
    int rodIndex,
  ) {
    var type = "Saídas";

    if (rodIndex == 0) {
      type = "Entradas";
    }

    return BarTooltipItem(
      "$type\nR\$ ${rod.toY.toStringAsFixed(2)}",
      const TextStyle(color: Colors.white, fontSize: 12),
    );
  }

  double _calcMaxY(List<MetricsViewmodel> data) {
    final max = data.fold(0.0, (prev, d) {
      final bigger = d.income > d.expense ? d.income : d.expense;
      return bigger > prev ? bigger : prev;
    });
    return max * 1.3;
  }
}
