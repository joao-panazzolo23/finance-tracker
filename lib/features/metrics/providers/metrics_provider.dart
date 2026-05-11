import 'package:finance_tracker/features/metrics/dtos/finance-result-dto.dart';
import 'package:finance_tracker/features/transactions/repositories/transaction_repository.dart';

import '../../../shared/extensions/date_extensions.dart';
import '../../transactions/enums/transaction_type.dart';
import '../viewmodels/metrics_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'metrics_provider.g.dart';

///Retrieve expenses and incomes for every month in the past year
@riverpod
Future<List<MetricsViewmodel>> getMetrics(GetMetricsRef ref) async {
  final repository = ref.watch(transactionRepositoryProvider);
  final results = <MetricsViewmodel>[];
  final now = DateTime.now();

  for (int i = 11; i >= 0; i--) {
    final start = monthOffset(now, i);
    final end = DateTime(start.year, start.month + 1, 1);

    final expenses = repository.getMetrics(TransactionType.expense, start, end);
    final incomes = repository.getMetrics(TransactionType.income, start, end);

    results.add(MetricsViewmodel(expense: expenses, income: incomes));
  }

  return results;
}

@riverpod
FinanceResultDto getResumedReview(GetResumedReviewRef ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  final now = DateTime.now();
  var startDate = now.subtract(Duration(days: 365));

  final expenses = repository.getMetrics(
    TransactionType.expense,
    startDate,
    now,
  );

  final incomes = repository.getMetrics(
    TransactionType.income,
    startDate,
    now,
  );

  return FinanceResultDto(
    income: incomes,
    outcome: expenses,
    profit: incomes - expenses,
  );
}
