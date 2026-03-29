
import 'package:hive/hive.dart';
part 'transaction_type.g.dart';

@HiveType(typeId: 1)
enum TransactionType{
  @HiveField(0)
  received,
  @HiveField(1)
  expense
}