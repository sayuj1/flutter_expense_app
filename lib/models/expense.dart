import 'package:uuid/uuid.dart';

final uuid = const Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({required this.title, required this.amount, required this.date})
    : id = uuid.v4();
}
