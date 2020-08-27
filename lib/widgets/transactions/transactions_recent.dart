import 'package:flutter/material.dart';
import '../../models/transaction.dart';

class TransactionsRecent extends StatelessWidget {
  final List<Transaction> _recentTx;
  TransactionsRecent(this._recentTx);

  List<Map<String, Object>> get _recentTxSum {
    return List.generate(7, (index) {
      double dayTxSum = 0.0;
      DateTime today = new DateTime.now();
      DateTime recentDay = today.subtract(new Duration(days: index));
      for (var i = 0; i < _recentTx.length; i++) {
        if(_recentTx[i].date.day == recentDay.day) {
          dayTxSum = dayTxSum + _recentTx[i].amount;
        }
      }
      return {'day': recentDay.day, 'total': double.parse(dayTxSum.toString())};
    });
  }

  double get _totalRecentTxSum {
    double weekTxSum = 0.0;
    _recentTxSum.forEach((sum) {
      weekTxSum += sum['total'];
    });
    return weekTxSum;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ...(_recentTxSum).map((recentSum) {
            return Column(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.black38
                  ),
                  child: FractionallySizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black
                      ),
                    ),
                    heightFactor: double.parse(recentSum['total'].toString())/_totalRecentTxSum,
                    alignment: Alignment.bottomCenter,
                  ),
                  // child: Text(recentSum['total'].toString()),
                ),
                Text('date'),
                Text(recentSum['total'].toString()),  
                Text(_totalRecentTxSum.toString()),              
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}