import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:finance_tracker/features/transactions/providers/transaction_notifier.dart';
import 'package:finance_tracker/pages/transaction_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionTile extends ConsumerWidget {
  final TransactionModel transaction;

  const TransactionTile({super.key, required this.transaction});

  void seeDetails(BuildContext context, WidgetRef ref) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TransactionDetail(transaction: transaction),
      ),
    ).then((_) => ref.invalidate(transactionNotifierProvider));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var color = Colors.green;
    var icon = Icons.arrow_downward;

    if (transaction.type == TransactionType.expense) {
      color = Colors.red;
      icon = Icons.arrow_upward;
    }

    var avatar = CircleAvatar(
      backgroundColor: color,
      child: Icon(icon, color: Colors.white),
    );

    var title = Text(transaction.title);
    var trailing = Text(
      '${transaction.type == TransactionType.expense ? '-' : '+'}${transaction.amount}',
    );

    var textStyle = TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    return ListTile(
      leading: avatar,
      title: title,
      trailing: trailing,
      titleTextStyle: textStyle,
      subtitleTextStyle: TextStyle(color: Colors.grey[600]),
      subtitle: Text(transaction.date.toString()),
      onLongPress: () => seeDetails(context, ref),
    );
  }
}
