import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteElement,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteElement;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(child: Text('\$${transaction.amount}')),
            ),
          ),
          title:
              Text(transaction.title, style: Theme.of(context).textTheme.title),
          subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
          trailing: MediaQuery.of(context).size.width > 360
              ? TextButton.icon(
                  style: TextButton.styleFrom(primary: Colors.red),
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                  onPressed: () => deleteElement(transaction.id),
                )
              : IconButton(
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => deleteElement(transaction.id),
                ),
        ));
  }
}
