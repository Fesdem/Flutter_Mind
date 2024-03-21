import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transactions_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final deleteTx;

  const TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 30,
                ),
                // Container(
                // height: constraints.maxHeight * 0.6,
                // child: Image.asset('aasets/images/loading.jpg',
                // fit: BoxFit.cover,
                // ),
                // ),
              ],
            );
          })
        : ListView(
            children: 
              transactions.map(
                (tx) => TransactionItem(
                  key: ValueKey(tx.id),
                  transaction: tx,
                  deleteTx: deleteTx,
                ),
              ).toList(),
          );
          // The below is how a listView.builder is used.
          // ListView.builder(
          //   itemBuilder: (context, index) {
          //     return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
          //   },
          //   itemCount: transactions.length,
          // );
  // }
  }
}
