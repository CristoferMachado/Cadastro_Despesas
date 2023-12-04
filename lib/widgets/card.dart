// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeroCard extends StatelessWidget {
  HeroCard({
    super.key,
    required this.userId,
  });
  final String userId;

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> _usersStream =
        FirebaseFirestore.instance.collection('users').doc(userId).snapshots();
    return StreamBuilder<DocumentSnapshot>(
      stream: _usersStream,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Text("Document doe not exist");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        var data = snapshot.data!.data() as Map<String, dynamic>;

        return Cards(
          data: data,
        );
      },
    );
  }
}

class Cards extends StatelessWidget {
  Cards({
    super.key,
    required this.data,
  });
  final Map data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(
        255,
        97,
        161,
        134,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Saldo",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      height: 1.2,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "${data['type'] == 'credito' ? '+' : '-'} ${_formatCurrency(data['remainingAmont'])}",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      height: 1.2,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                CardOne(
                  color: Colors.green,
                  heading: 'Credito',
                  amount: "${_formatCurrency(data['totalCredit'])}",
                ),
                SizedBox(
                  width: 10,
                ),
                CardOne(
                  color: Colors.red,
                  heading: 'Debito',
                  amount: "${_formatCurrency(data['totalDebit'])}",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne(
      {super.key,
      required this.color,
      required this.heading,
      required this.amount});
  final Color color;
  final String heading;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: TextStyle(color: color, fontSize: 15),
                ),
                Text(" ${amount}",
                    style: TextStyle(
                        color: color,
                        fontSize: 25,
                        fontWeight: FontWeight.w600))
              ],
            ),
            Spacer(),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Icon(
            //     heading == "Credito"
            //         ? Icons.arrow_upward_outlined
            //         : Icons.arrow_downward_outlined,
            //     color: color,
            //   ),
            // )
          ]),
        ),
      ),
    );
  }
}

// Função para formatar o valor como moeda
String _formatCurrency(dynamic amount) {
  double amountAsDouble;

  if (amount is int) {
    // Se 'amount' for um int, convertemos diretamente para double
    amountAsDouble = amount.toDouble();
  } else if (amount is double) {
    // Se 'amount' já for um double, usamos diretamente
    amountAsDouble = amount;
  } else {
    // Caso contrário, tentamos converter a string para double
    amountAsDouble = double.tryParse(amount.toString()) ?? 0.0;
  }

  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return currencyFormat.format(amountAsDouble);
}
