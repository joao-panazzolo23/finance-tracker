import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/transaction_model.dart';

part 'transaction_repository.g.dart';

//this is @riverpod's boilerplate code old form
// final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
//   return TransactionRepository();
// });
@riverpod
TransactionRepository transactionRepository(Ref ref) {
  return TransactionRepository();
}

class TransactionRepository {
  final box = Hive.box<TransactionModel>('transactions');

  // Build method can be empty, but never undeclared
  @override
  FutureOr<void> build() {}

  Future<List<TransactionModel>> fetchTransactions() async {
    return box.values.toList();
  }

  Future<void> add(TransactionModel model) async {
    await box.add(model);
  }

  Future<void> delete(TransactionModel model) async {
    await box.delete(model);
  }

  Future<void> update(TransactionModel model) async {
    await model.save();
    //await model.(); // HiveObject method
  }
}

//faking an API call
// await Future.delayed(Duration(seconds: 2));
//
// //returning a hardcoded list to represent data retrieve
// return [
// TransactionModel(
// id: '1',
// title: 'Salário',
// amount: 1570,
// date: DateTime.now(),
// type: TransactionType.received,
// ),
// TransactionModel(
// id: '2',
// title: 'Mercado',
// amount: 185,
// date: DateTime.now().add(Duration(days: -1)),
// type: TransactionType.expense,
// ),
// ...transactions
// ];
