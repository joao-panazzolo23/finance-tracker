import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:finance_tracker/features/transactions/providers/transaction_provider.dart';
import 'package:finance_tracker/shared/validators/currency_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  ///Init state => life cycle method for Stateful widgets
  ///Called once, after state object is created and inserted at widget three
  ///belongs to the state, not the class itself
  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    descriptionController = TextEditingController();
  }

  ///Between TextField & TextFormField
  ///TextField: simple, basic input. No validations
  ///TextFormField: Complete forms, with validation and
  @override
  Widget build(BuildContext context) {
    var spacing = const SizedBox(height: 16);

    final column = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildMenu(),
        spacing,
        buildAmountField(),
        spacing,
        buildDescriptionField(),
        spacing,
        buildSaveButton(),
      ],
    );

    final form = Form(key: _formKey, child: column);

    return Padding(padding: const EdgeInsets.all(16.0), child: form);
  }

  void onSavePressed() {
    if (_formKey.currentState!.validate()) {
      final notifier = ref.read(transactionProviderProvider.notifier);
      // final repository = ref.read(transactionRepositoryProvider.notifier);

      var model = TransactionModel(
          id: 'NONE99',
          title: descriptionController.text,
          amount: double.parse(amountController.text),
          date: DateTime.now(),
          type: selectedType
      );

      notifier.addTransaction(model);
      print('Type: $selectedType');
      print('Amount: ${amountController.text}');
      print('Description: ${descriptionController.text}');
      Navigator.pop(context);
    }
  }

  Widget buildDescriptionField() {
    return TextFormField(
      controller: descriptionController,
      decoration: InputDecoration(
        hintText: "Descrição",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) =>
      (value == null || value
          .trim()
          .isEmpty)
          ? 'Descrição obrigatória'
          : null,
    );
  }

  Widget buildAmountField() {
    return TextFormField(
      controller: amountController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      validator: CurrencyValidator.validate,
      decoration: InputDecoration(
        hintText: 'Valor (0.00)',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget buildMenu() {
    return DropdownMenu(
      initialSelection: selectedType,
      dropdownMenuEntries: [
        DropdownMenuEntry(value: TransactionType.expense, label: "Saída"),
        DropdownMenuEntry(value: TransactionType.received, label: "Entrada"),
      ],
      onSelected: (value) {
        setState(() => selectedType = value!);
      },
    );
  }

  Widget buildSaveButton() {
    return ElevatedButton(
      onPressed: () => onSavePressed(),
      child: const Text('Adicionar'),
    );
  }
}
