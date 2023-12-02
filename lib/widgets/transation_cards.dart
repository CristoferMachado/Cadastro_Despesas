import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/icons_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransationsCard extends StatelessWidget {
   TransationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Text("Transações Recentes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return TransactionCard();
              })
        ],
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
   TransactionCard({
    super.key,
  });

  var appIcons = AppIcons();

  @override
  Widget build(BuildContext context) {
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
          contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
          leading: Container(
            width: 70,
            height: 100,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green.withOpacity(0.3),
              ),
              child: Center(
                child: FaIcon(
                  appIcons.getExpenseCategoryIcons('home')
                ),
              ),
            ),
          ),
          title: Row(
            children: [
              Expanded(child: Text("Card test oct 2023")),
              Text(
                "R\$ 5.000,00",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Balanço",
                        style: TextStyle(
                            color: Colors.grey, fontSize: 13)),
                    Spacer(),
                    Text(
                      "525",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 13),
                    )
                  ],
                ),
                Text(
                  "25 oct 4:51 PM",
                  style: TextStyle(color: Colors.grey),
                )
              ]),
        ),
      ),
    );
  }
}
