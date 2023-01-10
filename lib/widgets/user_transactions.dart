import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'Piano',
      amount: 200,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Ps5',
      amount: 669,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String Txtitle, double Txamount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: Txtitle,
        amount: Txamount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
