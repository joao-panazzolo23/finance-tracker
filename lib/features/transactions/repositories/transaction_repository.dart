import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:finance_tracker/shared/extensions/date_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/transaction_model.dart';

part 'transaction_repository.g.dart';


// });//this is @riverpod's boilerplate code old form
// // final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
// //   return TransactionRepository();
@riverpod
TransactionRepository transactionRepository(Ref ref) {
  final box = ref.watch(transactionBoxProvider);
  return TransactionRepository(box: box);
}

///Returns an instance of transactions box.
@riverpod
Box<TransactionModel> transactionBox(Ref ref) {
  return Hive.box<TransactionModel>('transactions');
}

class TransactionRepository {
  final Box<TransactionModel> box;

  const TransactionRepository({required this.box});

  Future<List<TransactionModel>> getAll() async {
    return box.values.toList();
  }

  Future<void> add(TransactionModel model) async {
    await box.add(model);
  }

  Future<void> delete(TransactionModel model) async {
    await model.delete();
  }

  Future<void> update(TransactionModel model) async {
    await model.save(); // HiveObject method
  }

  double getMetrics(
    TransactionType type,
    DateTime startDate,
    DateTime endDate,
  ) {
    final results = box.values.where(
      (x) => x.type == type && x.date.isBetween(startDate, endDate),
    );

    return results.fold<double>(
      0,
      (total, item) => total + item.amount,
    );
  }
}
