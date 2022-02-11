import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.mediaQuery,
    required Function deleteTransaction,
  })  : _deleteTransaction = deleteTransaction,
        super(key: key);

  final Transaction transaction;
  final MediaQueryData mediaQuery;
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: FittedBox(
            child: Text(
              '\$${transaction.amount}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ),
      title: Text(
        transaction.title,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        DateFormat.yMMMd().format(transaction.date),
      ),
      trailing: mediaQuery.size.width < 360
          ? IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error,
              ),
              onPressed: () => _deleteTransaction(transaction.id),
            )
          : SizedBox(
              width: mediaQuery.size.width * 0.23,
              child: TextButton(
                onPressed: () => _deleteTransaction(transaction.id),
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
                        color: Theme.of(context).colorScheme.error,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
