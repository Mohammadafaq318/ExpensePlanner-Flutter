import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredamount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredamount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredamount,
    );

    Navigator.of(context).pop();
  }

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              TextButton(
                  onPressed: submitData,
                  child: Text('Add Transaction'),
                  style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColorDark))
            ]),
      ),
    );
  }
}
