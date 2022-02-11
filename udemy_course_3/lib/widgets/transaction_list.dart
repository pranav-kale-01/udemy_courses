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
                  child: TransactionItem(
                      transaction: transactions[index],
                      mediaQuery: mediaQuery,
                      deleteTransaction: _deleteTransaction),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
