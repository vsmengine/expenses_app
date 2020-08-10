import 'package:flutter/material.dart';

class TransactionAdd extends StatelessWidget {
  String inputName;
  double inputAmount;
  //DateTime inputDate;

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
              print(inputName);
            },
          ),
          TextFormField(
            onFieldSubmitted: (value) {
              inputAmount = double.parse(value);
              print(inputAmount);
            },
          ),
          FlatButton(
            child: Text('Submit'),
            onPressed: () {
              //newTxHandler(inputName, inputAmount);
              print(inputName);
              print(inputAmount);
            },
          ),
        ],
      )
    );
  }
}