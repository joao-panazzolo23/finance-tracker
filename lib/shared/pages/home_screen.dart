import 'package:finance_tracker/features/transactions/pages/transaction_page.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/app-navigation-bar.dart';
import '../../features/metrics/pages/metrics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const TransactionPage(),
    const Metrics(),
    const Center(child: Text('Configurações')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: AppNavigationBar(
            selectedIndex: _currentIndex,
            onChange: _handleTabChange
        )
    );
  }


  void _handleTabChange(int index) {
    setState(() => _currentIndex = index);
  }
}






