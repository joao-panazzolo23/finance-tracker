import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:finance_tracker/features/transactions/providers/transaction_notifier.dart';

final filterProvider = StateProvider<TransactionType>((ref) => TransactionType.expense);

final filteredTransactionsProvider = Provider<List<TransactionModel>>((ref) {
  final filter = ref.watch(filterProvider);
  final asyncTx = ref.watch(transactionNotifierProvider);

  return asyncTx.maybeWhen(
    data: (list) {
      return list.where((t)=> t.type == filter).toList();
    },
    orElse: () => [],
  );
});
