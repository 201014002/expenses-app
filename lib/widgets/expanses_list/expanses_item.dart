
import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key,required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16.0),
          child: Column(
            children: [
              Text(expense.title),
              SizedBox(height: 4.0,),
              Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}',),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(width: 4.0,),
                      Text(expense.formattedDate),
                    ],
                  ),
                ],
              )
            ],
          ),
    ));
  }
}
