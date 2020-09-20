import 'package:flutter/material.dart';

import './transaction_card.dart';
import '../../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> _transactionList;
  TransactionsList(this._transactionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal:10),
      decoration: BoxDecoration(
        
      ),
      child: _transactionList.length > 0 ? ListView.builder(
        itemBuilder: (ctx, index) { 
          return TransactionCard(_transactionList[index]);
        },
        itemCount: _transactionList.length,
      ) : Container(
        child: Column(
          children: <Widget>[
            Text('No items can be found !'),
            Image.asset('assets/images/icons/icon-empty.png'),
          ],
        ),
      ),
    );

    //Column(
    //   children: _transactionList.map((transaction) {
    //     return TransactionCard(transaction);
    //   }).toList(),
    // );
  }


}