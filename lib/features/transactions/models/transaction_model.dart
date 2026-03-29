import 'package:hive/hive.dart';

import '../enums/transaction_type.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final TransactionType type;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  });
}
