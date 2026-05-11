import 'package:finance_tracker/core/widgets/app-snack-bar.dart';
import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:finance_tracker/features/transactions/providers/transaction_notifier.dart';
import 'package:finance_tracker/features/transactions/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionDetail extends ConsumerStatefulWidget {
  final TransactionModel transaction;

  const TransactionDetail({super.key, required this.transaction});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TransactionDetail();
  }
}

class _TransactionDetail extends ConsumerState<TransactionDetail> {
  late TextEditingController _titleController;
  late TextEditingController _amountController;
  late TransactionType _selectedType;
  late TransactionNotifier _notifier;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: form(),
    );
  }

  Widget saveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: _save, child: const Text('Salvar')),
    );
  }

  PreferredSizeWidget? appBar() {
    return AppBar(
      title: const Text("Editar transação"),
    );
  }

  Widget form() {
    var spacing = const SizedBox(height: 16);

    var form = Form(
      key: _formKey,
      child: Column(
        children: [
          titleField(),
          spacing,
          amountField(),
          spacing,
          dropdownType(),
          const Spacer(),
          saveButton()
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: form,
    );
  }

  Widget titleField() {
    return TextFormField(
      controller: _titleController,
      decoration: const InputDecoration(labelText: 'Descrição'),
      validator: (v) => v == null || v.isEmpty ? 'Obrigatório' : null,
    );
  }

  Widget amountField() {
    return TextFormField(
      controller: _amountController,
      decoration: const InputDecoration(labelText: 'Valor'),
      keyboardType: TextInputType.number,
      validator: (v) => v == null || v.isEmpty ? 'Obrigatório' : null,
    );
  }

  DropdownButtonFormField<TransactionType> dropdownType() {
    return DropdownButtonFormField<TransactionType>(
        initialValue: _selectedType,
        decoration: const InputDecoration(labelText: 'Tipo de transação'),
        items: [
          DropdownMenuItem(
            value: TransactionType.expense,
            child: Text('Saída'),
          ),
          DropdownMenuItem(
            value: TransactionType.income,
            child: Text('Entrada'),
          )
        ],
        onChanged: (v) => setState(() => _selectedType = v!));
  }

  @override
  void initState() {
    super.initState();
    // filling all fields with old data
    _titleController = TextEditingController(text: widget.transaction.title);
    _amountController =
        TextEditingController(text: widget.transaction.amount.toString());
    _selectedType = widget.transaction.type;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    widget.transaction
      ..title = _titleController.text.trim()
      ..amount = double.parse(_amountController.text.trim())
      ..type = _selectedType;

    var notifier = ref.read(transactionRepositoryProvider);

    notifier.update(widget.transaction);
    if (mounted) Navigator.pop(context);

    AppSnackBar.success(context, message: "Transação atualizada com sucesso!");
  }
}
