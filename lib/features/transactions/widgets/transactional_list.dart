import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:finance_tracker/features/transactions/widgets/transaction_tile.dart';
import 'package:flutter/cupertino.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.transactions});

  final List<TransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const Center(child: Text('Nenhuma transação encontrada'));
    }

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return TransactionTile(transaction: transaction);
      },
    );
  }
}
