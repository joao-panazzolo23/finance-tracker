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
    return Scaffold(
      body: _settings(),
    );
  }

  Column _settings() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Text("skjdefdjsdk"),
        ),
      ],
    );
  }
}
