import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final formatter = DateFormat.yMd();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  maxLength: 50,
                  decoration: InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'No Date Selected'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final firstDate =
                            DateTime(now.year - 1, now.month, now.day);
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: now,
                          firstDate: firstDate,
                          lastDate: now,
                        );
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(e.name.toUpperCase()),
                        value: e,
                      ),
                    )
                    .toList(),
                onChanged: (newCat) {
                  if (newCat == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = newCat;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final double? enteredAmount =
                      double.tryParse(_amountController.text);
                  final bool amountIsInvalid =
                      enteredAmount == null || enteredAmount <= 0;
                  const snackBar = SnackBar(content: Text('Error'));
                  if (_titleController.text.trim().isEmpty ||
                      amountIsInvalid ||
                      _selectedDate == null) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('...'),
                        content: Text('...'),
                        actions: [
                          TextButton(
                            onPressed: ()=>Navigator.pop(context),
                            child: Text('Okey'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
