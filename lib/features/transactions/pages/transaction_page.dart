import 'package:finance_tracker/features/transactions/providers/transaction_notifier.dart';
import 'package:finance_tracker/features/transactions/widgets/transactional_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/add_transaction.modal.dart';

class TransactionPage extends ConsumerWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionState = ref.watch(transactionNotifierProvider);

    var appBar = AppBar(title: const Text('Transactions'));

    return Scaffold(
      appBar: appBar,
      body: transactionState.when(
        data: (transactions) => TransactionList(transactions: transactions),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Oops: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onAddPressed(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void onAddPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const AddTransactionModal(),
    );
  }
}
