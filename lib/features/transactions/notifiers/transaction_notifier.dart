import 'dart:async';

import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:finance_tracker/features/transactions/providers/transaction_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/transaction_repository.dart';

class TransactionNotifier extends AsyncNotifier<List<TransactionModel>> {
  late final TransactionRepository repository;

  @override
  FutureOr<List<TransactionModel>> build() {
    repository = ref.watch(transactionRepositoryProvider);
    return repository.fetchTransactions();
  }
}
