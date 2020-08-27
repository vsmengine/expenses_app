import 'package:expences_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  TransactionCard(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                transaction.amount.toStringAsFixed(2), 
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            width: 60.0,
            height: 60.0,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  transaction.title.toString(),
                  style: Theme.of(context).textTheme.headline3,
                  // style: TextStyle(
                  //   color: Colors.black,
                  //   fontSize: 16,
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
                Text(
                  DateFormat.yMMMd().format(transaction.date).toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}