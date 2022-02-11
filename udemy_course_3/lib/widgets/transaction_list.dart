import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  const TransactionList(this.transactions, this._deleteTransaction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                'No transaction added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.2,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (BuildContext ctx, int index) {
              return Card(
                elevation: 5,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
<<<<<<< HEAD
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Platform.isIOS
                          ? CupertinoTheme.of(context).primaryColor
                          : Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: mediaQuery.size.width < 380
                        ? IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            onPressed: () =>
                                _deleteTransaction(transactions[index].id),
                          )
                        : SizedBox(
                            width: mediaQuery.size.width * 0.23,
                            child: TextButton(
                              onPressed: () {
                                _deleteTransaction(transactions[index].id);
                              },
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.delete,
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                  SizedBox(
                                    width: mediaQuery.size.width * 0.01,
                                  ),
                                  Text(
                                    'Delete',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
=======
                  child: TransactionItem(
                      transaction: transactions[index],
                      mediaQuery: mediaQuery,
                      deleteTransaction: _deleteTransaction),
>>>>>>> 1e376f170bc6072677dc30218c182c6e667c9612
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
