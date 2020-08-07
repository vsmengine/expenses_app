import 'package:flutter/material.dart';

import './transactions_list.dart';
import './transactions_recent.dart';
import '../../models/transaction.dart';


class Transactions extends StatelessWidget {
  final List<Transaction> _transactions = [
    Transaction(id: '001', title: 'vegetables', amount: 12.51, date: DateTime.now(),),
    Transaction(id: '002', title: 'fruits', amount: 5.29, date: DateTime.now(),),
  ];

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionsRecent(),
        TransactionsList(_transactions),
      ],     
    );
  }
}