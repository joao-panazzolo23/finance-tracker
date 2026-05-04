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
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
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

    var shadows = BoxShadow(
      blurRadius: selectedIndex == 0 ? 30 : 10,
      offset: Offset(0, selectedIndex == 0 ? 10 : 4),
      color: Colors.black.withValues(alpha: selectedIndex == 0 ? 0.15 : 0.08),
    );

    var decorations = BoxDecoration(
      borderRadius: BorderRadius.circular(selectedIndex == 0 ? 28 : 20),
      boxShadow: [shadows],
    );

    var container = AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      decoration: decorations,
      // color: Theme.of(context).colorScheme.surface,
      child: material,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: container,
    );
  }
}

WidgetStateProperty<TextStyle> _labelTextStyle() => WidgetStateProperty.all(
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    );

WidgetStateProperty<IconThemeData> _themeData() =>
    WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return const IconThemeData(size: 28, color: Colors.blue);
      }
      return const IconThemeData(size: 24, color: Colors.grey);
    });

NavigationBarThemeData navigationBarTheme() {
  return NavigationBarThemeData(
      backgroundColor: Colors.white,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      indicatorColor: Colors.blue.withValues(alpha: 0.15),
      labelTextStyle: _labelTextStyle(),
      iconTheme: _themeData());
}
