import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      category: Category.word,
      title: 'Flutter Course',
      amount: 29.9,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.word,
      title: 'Cinema',
      amount: 9.5,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.word,
      title: 'Breakfast',
      amount: 39.8,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('data'),
          Expanded(
            child: ListView.builder(
                itemCount: _registeredExpenses.length,
                itemBuilder: (context, index) =>
                    Text(_registeredExpenses[index].title)),
          )
        ]),
      ),
    );
  }
}
