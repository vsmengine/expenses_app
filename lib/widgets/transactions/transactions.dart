import 'package:flutter/material.dart';

import './transactions_list.dart';
import './transactions_recent.dart';
import './transaction_add.dart';
import '../../models/transaction.dart';


class Transactions extends StatefulWidget {
    @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  final List<Transaction> _transactions = [
    Transaction(id: '001', title: 'vegetables', amount: 12.51, date: DateTime.now(),),
    Transaction(id: '002', title: 'fruits', amount: 5.29, date: DateTime.now(),),
  ];

  void _addNewTransaction(txTitle, txAmount) {
    var newTx = Transaction(id: '001', title: txTitle, amount: txAmount, date: DateTime.now());
    setState(() {
      _transactions.add(newTx);
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionsRecent(),
        TransactionsList(_transactions),
        TransactionAdd(_addNewTransaction),
      ],     
    );
  }
}