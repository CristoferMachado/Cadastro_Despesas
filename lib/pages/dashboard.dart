import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home_screen.dart';
import 'package:flutter_application_2/pages/login_screen.dart';
import 'package:flutter_application_2/pages/transaction_screen.dart';
import 'package:flutter_application_2/widgets/navbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var isLogoutLoading = false;
  int currentIndex = 0;
  var pageViewList = [
    HomeScreen(),
    TransactionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(selectedIndex: currentIndex, onDestinationSelected: (int value) {
        setState(() {
          currentIndex = value;
        });
        },),
      body: pageViewList[currentIndex],
    );
  }
}
