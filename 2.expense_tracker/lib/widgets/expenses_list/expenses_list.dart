import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense removeItem) onRemoveExpense;

  @override
  Widget build(BuildContext context) {

  
    // TODO: implement build
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (e) {
         onRemoveExpense(expenses[index]);
        },
        child: ExpensesItem(expense: expenses[index]),
      ),
    );
  }
}
