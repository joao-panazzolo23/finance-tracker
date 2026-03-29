import 'dart:async';
import 'dart:ffi';
import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/transaction_repository.dart';

class TransactionNotifier extends AsyncNotifier<List<TransactionModel>> {
  late final TransactionRepository repository;

  @override
  FutureOr<List<TransactionModel>> build() async {
    final box = ref.watch(transactionRepositoryProvider);
    return repository.fetchTransactions();
  }

  Future<void> addTransactions(TransactionModel model) async {
    state = const AsyncLoading();
    final current = state.value ?? [];
    state = AsyncData([...current, model]);
    await repository.add(model);
  }
}
