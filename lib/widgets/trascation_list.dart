import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/trascation.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _listOfTx;

  TransactionList(this._listOfTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: 
                          Border.all(
                              color: Theme.of(context).primaryColorDark, 
                              width: 2
                            )
                          ),
                    child: Text(
                        '\$${_listOfTx[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColorDark,
                          ),
                      ),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _listOfTx[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(
                        DateFormat.yMMMd().format(_listOfTx[index].date),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: _listOfTx.length,
          ),
    );
  }
}