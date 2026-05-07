import 'package:finance_tracker/features/transactions/pages/transaction_page.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/app-navigation-bar.dart';
import '../../features/configurations/pages/configurations-page.dart';
import '../../features/metrics/pages/metrics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _currentIndex = 0;
  final _pageController = PageController();

  final List<Widget> _pages = [
    const TransactionPage(),
    const Metrics(),
    const ConfigurationsPage()
    // const Center(child: Text('Configurações')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: _pages[_currentIndex],
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: _pages,
        ),
        bottomNavigationBar: AppNavigationBar(
          selectedIndex: _currentIndex,
          onChange: _onTabChanged,
        ));
  }

  void _onTabChanged(int index) {
    // setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }
}
