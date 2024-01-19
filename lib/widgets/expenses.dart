import 'package:expenses/models/expense.dart';
import 'package:expenses/widgets/expanses_list/expanses_list.dart';
import 'package:expenses/widgets/expanses_list/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      category: Category.work,
      title: 'Flutter Course',
      amount: 29.9,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.leisure,
      title: 'Cinema',
      amount: 9.5,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'Breakfast',
      amount: 39.8,
      date: DateTime.now(),
    ),
  ];
  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }
  void _removeExpense(Expense expense){
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => NewExpense(onAddExpense:_addExpense),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('data'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense,),
          )
        ]),
      ),
    );
  }
}
