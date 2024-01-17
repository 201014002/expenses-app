import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, trave, leisure, word }

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {required this.category,
      required this.title,
      required this.amount,
      required this.date})
      : id = uuid.v4();
}

var v1 = Expense(
  category: Category.word,
  title: 'Flutter Course',
  amount: 29.9,
  date: DateTime.now(),
);
