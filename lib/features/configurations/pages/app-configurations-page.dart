import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppConfigurations extends ConsumerStatefulWidget{
  const AppConfigurations({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppConfigurations();
}

class _AppConfigurations extends ConsumerState<AppConfigurations>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:_settings());
  }

  Column _settings(){
    return Column();
  }

}

// class AppConfigurations extends ConsumerState<>