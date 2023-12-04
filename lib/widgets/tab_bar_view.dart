import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/transacao_list.dart';

class TypeTabBar extends StatelessWidget {
  const TypeTabBar(
      {super.key,
      required this.category,
      required this.monthYear,});
  final String category;
  final String monthYear;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(tabs: [
            Tab(
              text: 'Credito',
            ),
            Tab(
              text: 'Debito',
            )
          ]),
          Expanded(
              child: TabBarView(children: [
            TransectionList(
              category: category,
              monthYear: monthYear,
              type: 'credito',
            ),
            TransectionList(
              category: category,
              monthYear: monthYear,
              type: 'debito',
            ),
          ]))
        ],
      ),
    ));
  }
}
