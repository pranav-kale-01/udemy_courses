import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/chart.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: selectedDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext cont, mediaQuery) {
    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: (mediaQuery.size.height * 0.80),
      ),
      context: cont,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  void _deleteTransaction(String transactionId) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == transactionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final appBar = AppBar(
      title: const Text('Personal Expenses'),
      actions:  [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context, mediaQuery),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        height: mediaQuery.size.height,
        child: SingleChildScrollView(
          child: mediaQuery.orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: (mediaQuery.size.height * 0.4) -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top,
                      child: Chart(_recentTransactions),
                    ),
                    SizedBox(
                      height: (mediaQuery.size.height * 0.6),
                      child:
                          TransactionList(_userTransaction, _deleteTransaction),
                    ),
                  ],
                )
              : Row(
                  children: [
                    SizedBox(
                      width: mediaQuery.size.width * 0.4,
                      height: (mediaQuery.size.height * 0.7) -
                          appBar.preferredSize.height,
                      child: Chart(_recentTransactions),
                    ),
                    SizedBox(
                      width: mediaQuery.size.width * 0.6,
                      height: mediaQuery.size.height * 0.78,
                      child:
                          TransactionList(_userTransaction, _deleteTransaction),
                    ),
                  ],
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context, mediaQuery),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
