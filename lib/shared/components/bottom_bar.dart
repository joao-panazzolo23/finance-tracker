import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final Function(int) onTabChange;
  final int currentTab;

  const BottomBar(
      {super.key, required this.onTabChange, required this.currentTab});

  @override
  State<StatefulWidget> createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [summary(), metrics(), configurations()]);
  }

  BottomNavigationBarItem summary() {
    return BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Sumário");
  }

  BottomNavigationBarItem metrics() {
    return BottomNavigationBarItem(
        icon: Icon(Icons.bar_chart), label: "Métricas");
  }

  BottomNavigationBarItem configurations() {
    return BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: "Configurações");
  }
}
