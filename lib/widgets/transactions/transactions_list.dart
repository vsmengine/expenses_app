import 'package:flutter/material.dart';

import './transaction_card.dart';
import '../../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> _transactionList;
  TransactionsList(this._transactionList);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _transactionList.map((transaction) {
        return TransactionCard(transaction);
      }).toList(),
    );
  }
}