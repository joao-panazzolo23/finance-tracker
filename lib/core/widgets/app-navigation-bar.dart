import 'package:flutter/material.dart';

class AppNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChange;

  const AppNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    var destinations = [
      NavigationDestination(icon: Icon(Icons.wallet), label: "Saldo"),
      NavigationDestination(icon: Icon(Icons.bar_chart), label: "Métricas"),
      NavigationDestination(icon: Icon(Icons.settings), label: "Configurações"),
    ];

    var navBar = NavigationBar(
      destinations: destinations,
      onDestinationSelected: onChange,
      selectedIndex: selectedIndex,
      height: 60,
      elevation: 0,
    );

    var material = Material(
      color: Theme.of(context).colorScheme.surface,
      elevation: 6,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: navBar,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: material,
    );
  }
}

NavigationBarThemeData navigationBarTheme() {
  return NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: Colors.blue.withAlpha(1),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      iconTheme: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return const IconThemeData(color: Colors.blue);
        }
        return const IconThemeData(color: Colors.grey);
      }));
}
