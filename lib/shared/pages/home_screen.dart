import 'package:finance_tracker/features/transactions/pages/transaction_page.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      items: tabs(),
      onTap: _handleTabChange,
      currentIndex: _currentIndex,
    );
  }

  List<BottomNavigationBarItem> tabs() {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Saldo"),
      BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Métricas"),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings), label: "Configurações"),
    ];
  }

  void _handleTabChange(int index) {
    setState(() => _currentIndex = index);
  }


}
