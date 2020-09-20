import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transactions_list.dart';
import './transactions_recent.dart';
import './transaction_add.dart';
import '../../models/transaction.dart';

class Transactions extends StatefulWidget {
  final double availableScreenHeight;
  Transactions(this.availableScreenHeight);

  floatingAction(ctx) => createState()._openNewTransaction(ctx);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {

  final List<Transaction> _transactions = [
    Transaction(id: '001', title: 'Vegetables', amount: 12.51, date: DateTime.now(),),
    Transaction(id: '002', title: 'Fruits', amount: 5.29, date: DateTime.now(),),
    Transaction(id: '003', title: 'Clothes', amount: 8.81, date: DateTime.now(),),
  ];

  void _addNewTransaction(txTitle, txAmount) {
    var newTx = Transaction(id: '000', title: txTitle, amount: txAmount, date: DateTime.now());
    setState(() {
      _transactions.add(newTx);
    });
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      DateTime today = new DateTime.now();
      DateTime sevenDaysAgo = today.subtract(new Duration(days: 7));
      return element.date.isAfter(sevenDaysAgo);
    }).toList();
  }

  _openNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: TransactionAdd(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: widget.availableScreenHeight * 0.4,
            child: TransactionsRecent(_recentTransactions)
          ),
          Container(
            height: widget.availableScreenHeight * 0.6,
            child: TransactionsList(_transactions)
          ),
        ],     
      ),
    );
  }
}