import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTransactionModal extends ConsumerStatefulWidget {
  const AddTransactionModal({super.key});

  @override
  ConsumerState<AddTransactionModal> createState() =>
      _AddTransactionModalState();
}

class _AddTransactionModalState extends ConsumerState<AddTransactionModal> {
  late TextEditingController amountController;
  late TextEditingController descriptionController;
  TransactionType selectedType = TransactionType.expense;

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var menu = DropdownMenu(
      dropdownMenuEntries: [
        DropdownMenuEntry(value: TransactionType.expense, label: "Saída"),
        DropdownMenuEntry(value: TransactionType.received, label: "Entrada"),
      ],
      onSelected: (value) {
        setState(() => selectedType = value!);
      },
    );

    var saveButton = ElevatedButton(
      onPressed: () {
        print('Type: $selectedType');
        print('Amount: ${amountController.text}');
        print('Description: ${descriptionController.text}');
        Navigator.pop(context);
      },
      child: const Text('Adicionar'),
    );

    var amountField = TextField(
      controller: amountController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        hintText: 'Valor (0.00)',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );

    var descriptionField = TextField(
      controller: descriptionController,
      decoration: InputDecoration(
        hintText: "Descrição",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );

    final column = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        menu,
        const SizedBox(height: 16),
        amountField,
        const SizedBox(height: 16),
        descriptionField,
        const SizedBox(height: 16),
        saveButton,
      ],
    );

    return Padding(padding: const EdgeInsets.all(16.0), child: column);
  }
}
