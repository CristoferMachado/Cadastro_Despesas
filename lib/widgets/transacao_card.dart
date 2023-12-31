import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/icons_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  TransactionCard({
    super.key,
    required this.data,
  });
  final dynamic data;

  var appIcons = AppIcons();

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(data['timestamp']);
    String formatDate = DateFormat('d MMM hh:mma').format(date);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  color: Colors.grey.withOpacity(0.09),
                  blurRadius: 10.0,
                  spreadRadius: 4.0)
            ]),
        child: ListTile(
          minVerticalPadding: 10,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          leading: Container(
            width: 70,
            height: 100,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: data['type'] == 'credito'
                    ? Colors.green.withOpacity(0.3)
                    : Colors.red.withOpacity(0.2),
              ),
              child: Center(
                child: FaIcon(
                    appIcons.getExpenseCategoryIcons('${data['category']}'),
                    color:
                        data['type'] == 'credito' ? Colors.green : Colors.red),
              ),
            ),
          ),
          title: Row(
            children: [
              Expanded(
                child: Text('${data['title']}'),
              ),
              Text(
                "${data['type'] == 'credito' ? '+' : '-'} ${_formatCurrency(data['amount'])}",
                style: TextStyle(
                  color: data['type'] == 'credito' ? Colors.green : Colors.red,
                ),
              )
            ],
          ),
          subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Saldo",
                        style: TextStyle(color: Colors.grey, fontSize: 13)),
                    Spacer(),
                    Text(
                      "R\$ ${data['remainingAmount']}",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    )
                  ],
                ),
                Text(
                  formatDate,
                  style: TextStyle(color: Colors.grey),
                )
              ]),
        ),
      ),
    );
  }
}

String _formatCurrency(dynamic amount) {
  double amountAsDouble;

  if (amount is int) {
    amountAsDouble = amount.toDouble();
  } else if (amount is double) {
    amountAsDouble = amount;
  } else {
    amountAsDouble = double.tryParse(amount.toString()) ?? 0.0;
  }

  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return currencyFormat.format(amountAsDouble);
}
