import 'package:flutter/material.dart';
import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // String _title = '';

  // void _saveTitleInput(String value) {
  //   _title = value;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // allow all past dates
      lastDate: DateTime(2100), // allow future dates
    );
    if (pickedDate == null) {
      return;
    }
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _selectCategory(Category? category) {
    if (category == null) {
      return;
    }
    setState(() {
      _selectedCategory = category;
    });
  }

  // void _saveExpense() {
  //   final title = _titleController.text;
  //   final amount = double.parse(_amountController.text);
  //   final date = _selectedDate;
  //   final category = Category.food;
  //   final expense = Expense(
  //     title: title,
  //     amount: amount,
  //     date: date,
  //     category: category,
  //   );
  //   Navigator.pop(context, expense);
  // }

  @override
  void dispose() {
    // only state classes can implement dispose
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _dismiss() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            maxLength: 50,
            controller: _titleController,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$ ',
                  ),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "No Date Selected"
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: _selectCategory,
              ),
              const Spacer(),
              TextButton(onPressed: _dismiss, child: const Text("Cancel")),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
