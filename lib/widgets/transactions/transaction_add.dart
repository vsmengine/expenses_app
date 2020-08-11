import 'package:flutter/material.dart';

class TransactionAdd extends StatefulWidget {
  // String inputName;
  // double inputAmount;
  //DateTime inputDate;
  final Function newTxHandler;
  TransactionAdd(this.newTxHandler);

  @override
  _TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final name = nameController.text;
    final amount = double.parse(amountController.text);
    widget.newTxHandler(name, amount);
    print(name);
    print(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
            controller: nameController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            // },
          ),
          FlatButton(
            child: Text('Submit'),
            onPressed: submitData,
          ),
        ],
      )
    );
  }
}