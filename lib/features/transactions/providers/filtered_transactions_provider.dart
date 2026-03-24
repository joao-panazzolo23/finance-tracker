import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:finance_tracker/features/transactions/providers/transaction_provider.dart';

final filterProvider = StateProvider<String>((ref) => 'all');

final filteredTransactionsProvider = Provider<List<TransactionModel>>((ref) {
  final filter = ref.watch(filterProvider);
  final asyncTx = ref.watch(transactionProviderProvider);

  return asyncTx.maybeWhen(
    data: (list) {
      return list.where((t)=> t.type == filter).toList();
    },
    orElse: () => [],
  );
});

// if (filter == 'expense') {
//   return list.where((t) => t.type == TransactionType.expense).toList();
// }
// if (filter == 'income') {
//   return list.where((t) => t.type == TransactionType.received).toList();
// }
// return list;