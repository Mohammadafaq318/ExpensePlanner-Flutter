import 'package:expensetracker/widgets/new_transaction.dart';
import 'package:expensetracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.red,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddnewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
                elevation: 5,
                color: Colors.blue,
              ),
            ),
            TransactionList(_userTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddnewTransaction(context),
      ),
    );
  }
}
