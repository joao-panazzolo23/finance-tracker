import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:finance_tracker/features/transactions/widgets/transaction_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

///Equivalent to .NET's Program.cs
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TransactionModelAdapter());
  Hive.registerAdapter(TransactionTypeAdapter());

  await Hive.openBox<TransactionModel>('transactions');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: TransactionView(),
    );
  }
}
