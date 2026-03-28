import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/transaction_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'transaction_repository.g.dart';

//this is @riverpod's boilerplate code old form
// final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
//   return TransactionRepository();
// });

@riverpod
class TransactionRepository extends _$TransactionRepository {
  List<TransactionModel> transactions = [];

  // Build method can be empty, but not undeclared
  @override
  FutureOr<void> build() {}


  Future<List<TransactionModel>> fetchTransactions() async {
    //faking an API call
    await Future.delayed(Duration(seconds: 2));

    //returning a hardcoded list to represent data retrieve
    return [
      TransactionModel(
        id: '1',
        title: 'Salário',
        amount: 1570,
        date: DateTime.now(),
        type: TransactionType.received,
      ),
      TransactionModel(
        id: '2',
        title: 'Mercado',
        amount: 185,
        date: DateTime.now().add(Duration(days: -1)),
        type: TransactionType.expense,
      ),
      ...transactions
    ];
  }

  void add(TransactionModel model) {
    transactions.add(model);
  }
}
