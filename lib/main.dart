import 'package:finance_tracker/core/decorations/input-decoration-theme.dart';
import 'package:finance_tracker/features/transactions/enums/transaction_type.dart';
import 'package:finance_tracker/features/transactions/models/transaction_model.dart';
import 'package:finance_tracker/shared/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/widgets/app-navigation-bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: appTheme(),
    );
    //ThemeData(
    //       useMaterial3: true, navigationBarTheme: navigationBarTheme()),
    // );
  }
}
