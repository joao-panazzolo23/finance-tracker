import 'package:finance_tracker/features/transactions/providers/transaction_notifier.dart';
import 'package:finance_tracker/features/transactions/repositories/transaction_repository.dart';

import '../../transactions/enums/transaction_type.dart';
import '../viewmodels/metrics_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'metrics_provider.g.dart';

///Returns all
@riverpod
Future<List<MetricsViewmodel>> metrics(MetricsRef ref) async {
  return getMetrics(ref);
}

///Retrieve expenses and incomes for every month in the past year
Future<List<MetricsViewmodel>> getMetrics(MetricsRef ref) async {
  var repository = ref.watch(transactionRepositoryProvider);

  final results = <MetricsViewmodel>[];
  final now = DateTime.now();

  for (int i = 11; i >= 0; i--) {
    final date = DateTime(now.year, now.month - i, 1);

    final start = DateTime(date.year, date.month, 1);
    final end = DateTime(date.year, date.month + 1, 1);

    final expenses = await repository.getMetrics(
      TransactionType.expense,
      start,
      end,
    );

    final incomes = await repository.getMetrics(
      TransactionType.income,
      start,
      end,
    );

    results.add(MetricsViewmodel(
      expense: expenses,
      income: incomes,
    ));
  }

  return results;
}
