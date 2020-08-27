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
    final txname = nameController.text;
    final txamount = double.parse(amountController.text);
    if(txname.isEmpty || txamount <= 0) {
      return;
    } else { 
      widget.newTxHandler(txname, txamount);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal:15),
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
            keyboardType: TextInputType.number,
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