

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/adaptive_buttons.dart';

class NewTransaction extends StatefulWidget {
  final addTx;

  NewTransaction(this.addTx) {
    print('Constructor NewTransaction Widget');
  }

  @override
  State<NewTransaction> createState() {
    print('CreateState NewTransaction Widget');
    return _NewTransactionState();
    }
}

class _NewTransactionState extends State<NewTransaction> {
  //The method below in the two lines below are manual method to retrieve input from users.
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  _NewTransactionState() {
    print('Constructor NewTransaction State');
  }

  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: (context),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    // onChanged: (value) => titleInput = value,
                    controller: _titleController,
                    onSubmitted: (_) => _submitData,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    keyboardType: TextInputType.number,
                    // onChanged: (value) => amountInput = value,
                    controller: _amountController,
                    onSubmitted: (_) => _submitData,
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _selectedDate == null
                                ? 'No Date Chosen!'
                                : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                          ),
                        ),
                       AdaptiveTextButton('Choose Date', _presentDatePicker)
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: _submitData,
                    child: Text(
                      'Add Transaction',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
