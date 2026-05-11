import 'package:finance_tracker/features/metrics/dtos/finance-result-dto.dart';
import 'package:finance_tracker/features/metrics/providers/metrics_provider.dart';
import 'package:finance_tracker/features/metrics/widgets/balance_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/finance_header.dart';
import '../widgets/metric-card.dart';

class Metrics extends ConsumerWidget {
  const Metrics({super.key});

  // Row header() {
  //   var spacing = const SizedBox();
  //
  //   return Row(
  //     children: [
  //       _outcome(),
  //       spacing,
  //       _income(),
  //       spacing,
  //       _saved(),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var spacing = const SizedBox(
      height: 4,
    );

    //todo: fazer um provider q traga os valores de entrada e de saída
    var financeDto = ref.watch(getResumedReviewProvider);
    var column = Column(
      children: [
        FinanceHeader(totalBalance: financeDto.profit, period: "Nos últimos 12 meses"),
        spacing,
        row(financeDto),
        SizedBox(height: 24),
        BalanceChart(),
      ],
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: column,
    );
  }

  Row row(FinanceResultDto dto) {
    var spacing = const SizedBox(
      width: 10,
    );

    return Row(children: [
      _income(dto),
      spacing,
      _outcome(dto),
      spacing,
      _saved(dto),
    ]);
  }

  Expanded _saved(FinanceResultDto dto) {
    return Expanded(
        child: MetricCard(
      label: "lucro",
      dotColor: Colors.deepPurple,
      value: dto.profit,
      isPositive: true,
      trend: "+12% mês", //trocar isso dps pra algo dinâmico
    ));
  }

  Expanded _income(FinanceResultDto dto) {
    return Expanded(
        child: MetricCard(
      label: "saídas",
      dotColor: Colors.redAccent,
      value: dto.income,
      isPositive: true,
      trend: "+5% mês", //trocar isso dps pra algo dinâmico
    ));
  }

  Expanded _outcome(FinanceResultDto dto) {
    return Expanded(
        child: MetricCard(
      label: "entradas",
      dotColor: Colors.green,
      value:  dto.outcome,
      isPositive: false,
      trend: "-4% mês", //trocar isso dps pra algo dinâmico
    ));
  }
}
