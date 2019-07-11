import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/trascation_list.dart';
import './models/trascation.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, //automatically fix color for different widgets
        accentColor: Colors.amber,
        // fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    final List<Transaction> _userTransactions = [
  Transaction(
      id: 't1', 
      title: 'New Shoes', 
      amount: 69.99, 
      date: DateTime.now()
  ),
  Transaction(
      id: 't2', 
      title: 'Dinner', 
      amount: 500.00, 
      date: DateTime.now()
  ),
];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle, 
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
      );

      setState(() {
        _userTransactions.add(newTx); 
      });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx, 
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Flutter App'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed:() => _startAddNewTransaction(context),
              ),
            ],
          ),
            body: SingleChildScrollView(
              child: 
                Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    child: Container(
                        color: Colors.lightBlue,
                        width: double.infinity,
                        child: Text('Chart placeholder')
                      ),
                  ),
                  TransactionList(_userTransactions),
                ],
              ),
            ),

            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, 
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
              onPressed: () => _startAddNewTransaction(context),
            ),
          );
  }
}
