import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/transaction.dart';
import 'package:flutter_application_5/widgets/transaction_item.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
 const TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constrains) {
                return Column(
                  children: [
                    Text(
                      'No Transactions added yet',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: constrains.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
            
              itemBuilder: (ctx, index) {
                return TransactionItem(transaction: transactions[index], deleteTx: deleteTx,);
              },
              itemCount: transactions.length,
            ),
    );
  }
}


