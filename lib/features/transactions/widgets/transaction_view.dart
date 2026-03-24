import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionView extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    final transactions = ref.watch(transa)
  }
  
}