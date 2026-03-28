import 'dart:async';

import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/transaction_repository.dart';

class TransactionNotifier extends AsyncNotifier<List<TransactionModel>> {
  late final TransactionRepository repository;

  @override
  FutureOr<List<TransactionModel>> build() {
    repository = ref.read(transactionRepositoryProvider.notifier);
    return repository.fetchTransactions();
  }

  void addTransactions(TransactionModel model) {
    final current = state.value ?? [];
    state = AsyncData([...current, model]);
    repository.add(model);
  }
}
