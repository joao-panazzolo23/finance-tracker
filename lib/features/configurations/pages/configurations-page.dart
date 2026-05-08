import 'package:finance_tracker/core/colors/app-theme-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfigurationsPage extends ConsumerStatefulWidget {
  const ConfigurationsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppConfigurations();
}

class _AppConfigurations extends ConsumerState<ConfigurationsPage> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(appThemeNotifierProvider);
    final notifier = ref.read(appThemeNotifierProvider.notifier);
    final isDarkMode = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: _settings(),
      body: _padding(
        isDarkMode,
        notifier,
      ),
    );
  }

  Future<void> _onSwitchChanged(
    bool value,
    AppThemeNotifier notifier,
  ) async {
    await notifier.toggle();
  }

  AppBar _settings() {
    return AppBar(
      title: Text("Configurações"),
    );
  }

  Padding? _padding(
    bool isDarkMode,
    AppThemeNotifier notifier,
  ) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: _switchListTile(isDarkMode, notifier),
    );
  }

  SwitchListTile _switchListTile(bool isDarkMode, AppThemeNotifier notifier) {
    return SwitchListTile(
      secondary: const Icon(Icons.dark_mode),
      subtitle: const Text("Modo escuro"),
      value: isDarkMode,
      onChanged: (value) async {
        await notifier.toggle();
      },
    );
  }
}
