import 'package:flutter/material.dart';

class TransactionAdd extends StatelessWidget {
  String inputName;
  double inputAmount;
  DateTime inputDate;

  final Function newTxHandler;
  TransactionAdd(this.newTxHandler);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            onFieldSubmitted: (value) {
              inputName = value;
            },
          ),
          TextFormField(
            onFieldSubmitted: (value) {
              inputAmount= double.parse(value);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                inputName.isNotEmpty ? 
                newTxHandler(inputName, inputAmount) : 
                print('add some input values');
              },
              child: Text('Submit'),
            ),
          ),
        ],
      )
    );
  }
}