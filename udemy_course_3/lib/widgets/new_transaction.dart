import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction(this.addNewTransaction, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? chosenDate;

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || chosenDate == null) {
      return;
    }

    widget.addNewTransaction(
      titleController.text,
      double.parse(amountController.text),
      chosenDate
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          chosenDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Card(
        child: Container(
          margin: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: mediaQuery.viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                onChanged: (value) {},
              ),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      chosenDate == null
                          ? 'No Date Chosen'
                          : 'Chosen Date - ${DateFormat.yMd().format(chosenDate!)}',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.black26,
                          ),
                        ),
                        onPressed: _presentDatePicker,
                        child: const Text("Choose Date"),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: const Text('Add Transaction'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).buttonTheme.colorScheme?.primary,
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    Theme.of(context).buttonTheme.colorScheme?.secondary,
                  ),
                ),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
        elevation: 5,
      ),
    );
  }
}
