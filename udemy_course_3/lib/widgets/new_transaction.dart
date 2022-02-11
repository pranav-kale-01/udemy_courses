import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:udemy_course_3/widgets/adaptive_flatbutton.dart';
import 'package:udemy_course_3/widgets/adaptive_text_field.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  DateTime? chosenDate;

  NewTransaction(this.addNewTransaction, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        widget.chosenDate == null) {
      return;
    }

    widget.addNewTransaction(titleController.text,
        double.parse(amountController.text), widget.chosenDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() async {
    Platform.isIOS
        ? showCupertinoModalPopup(
            context: context,
            builder: (_) => Container(
              height: 190,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (pickedDate) {
                        setState(() {
                          debugPrint('date is ' + pickedDate.toString());
                          widget.chosenDate = pickedDate;
                        });
                      },
                      initialDateTime: DateTime.now(),
                      minimumDate: DateTime(2017),
                      maximumDate: DateTime.now(),
                    ),
                  ),
                ],
              ),
            ),
          )
        : showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2015),
            lastDate: DateTime.now(),
          ).then((pickedDate) {
            if (pickedDate != null) {
              setState(() {
                widget.chosenDate = pickedDate;
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
              AdaptiveTextField.getAdaptiveTextField(
                title: 'Title',
                textController: titleController,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
              ),
              AdaptiveTextField.getAdaptiveTextField(
                title: 'Amount',
                textController: amountController,
                keyboardType: TextInputType.number,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.chosenDate == null
                          ? 'No Date Chosen'
                          : 'Chosen Date - ${DateFormat.yMd().format(widget.chosenDate!)}',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AdaptiveFlatButton.adaptiveFlatButton(
                        child: const Text('Choose Date'),
                        onPressed: _presentDatePicker,
                      ),
                    ),
                  ],
                ),
              ),
              AdaptiveFlatButton.adaptiveFlatButton(
                child: const Text('Add Transaction'),
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
