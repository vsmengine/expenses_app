import 'package:expences_app/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  TransactionCard(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(transaction.title),
    );
  }
}