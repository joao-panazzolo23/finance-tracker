import 'dart:async';

import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:finance_tracker/features/transactions/providers/filtered_transactions_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/transaction_repository.dart';

part 'transaction_notifier.g.dart';

///returning a global instance of TRANSACTION PROVIDER (not the class)
///This is comparable to Singleton pattern

///Provider's n
// if (filter == 'expense') {
//ame must match its partial class _$TransactionProvider
@riverpod
class TransactionNotifier extends _$TransactionNotifier {
  TransactionRepository get repository => ref.read(transactionRepositoryProvider);

  @override
  FutureOr<List<TransactionModel>> build() async {
    //decoupling like its DI containers
    //repository = TransactionRepository();
    return repository.fetchTransactions();
  }

  //Future<void> => Task in C#
  Future<void> addTransaction(TransactionModel model) async {
    state = AsyncLoading(); //(actual state of provider)
    await repository.add(model);
    state = AsyncData(await repository.fetchTransactions());
  }

  Future<void> updateTransaction(TransactionModel model) async {
    state = AsyncLoading(); //(actual state of provider)
    await repository.update(model);
    state = AsyncData(await repository.fetchTransactions());
  }
}

//now this is a derived class to our transaction provider
final balanceProvider = Provider<double>((ref) {
  //Fold => reduce the list to one single value
  final transactions = ref.watch(filteredTransactionsProvider);

  double total = 0;
  for (final tx in transactions) {
    if (tx.type == TransactionType.expense) {
      total -= tx.amount;
      continue;
    }
    total += tx.amount;
  }
  return total;
});
