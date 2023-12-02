import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/time_line_mounth.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansive'),
      ),
      body: Column(
        children: [

          TimeLineMonth(),
        ],
      ),
    );
  }
}