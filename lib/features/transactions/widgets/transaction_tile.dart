import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    var color = Colors.green;
    var icon = Icons.arrow_downward;

    if (transaction.type == TransactionType.expense) {
      color = Colors.red;
      icon = Icons.arrow_upward;
    }

    var avatar = CircleAvatar(
      backgroundColor: color,
      child: Icon(icon, color: color),
    );

    var title = Text(transaction.title ?? "Não identificado");
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
    );
  }
}
