import 'dart:async';

import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:finance_tracker/features/transactions/providers/filtered_transactions_provider.dart';
import 'package:finance_tracker/features/transactions/providers/transaction_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/transaction_repository.dart';

part 'transaction_provider.g.dart';

///returning a global instance of TRANSACTION PROVIDER (not the class)
///This is comparable to Singleton pattern

///Provider's name must match its partial class _$TransactionProvider
@riverpod
class TransactionProvider extends _$TransactionProvider {
  late final TransactionRepository repository;

  @override
  FutureOr<List<TransactionModel>> build() async {
    repository = ref.watch(transactionRepositoryProvider);
    //decoupling like its DI containers
    //repository = TransactionRepository();
    return repository.fetchTransactions();
  }

  //Future<void> => Task in C#
  Future<void> addTransaction(TransactionModel model) async {
    //State = AsyncValue (actual state of provider)
    //state = const AsyncLoading();

    final current = await future;
    state = AsyncData([...current, model]);
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
