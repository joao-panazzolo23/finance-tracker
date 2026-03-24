import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';

import '../models/transaction_model.dart';

class TransactionRepository {
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
          type: TransactionType.received
      ),
      TransactionModel(
          id: '2',
          title: 'Mercado',
          amount: 185,
          date: DateTime.now().add(Duration(days: -1)),
          type: TransactionType.expense
      )
    ];
  }
}
