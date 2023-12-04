import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons {
  final List<Map<String, dynamic>> homeExpensesCategories = [
    {
      "name": "Combustivel",
      "icon": FontAwesomeIcons.gasPump,
    },
    {
      "name": "Salario",
      "icon": FontAwesomeIcons.cashRegister,
    },
    {
      "name": "Mercado",
      "icon": FontAwesomeIcons.shoppingCart,
    },
    {
      "name": "Café",
      "icon": FontAwesomeIcons.mugHot,
    },
    {
      "name": "Internet",
      "icon": FontAwesomeIcons.wifi,
    },
    {
      "name": "Eletrecidade",
      "icon": FontAwesomeIcons.bolt,
    },
    {
      "name": "Água",
      "icon": FontAwesomeIcons.water,
    },
    {
      "name": "Casa",
      "icon": FontAwesomeIcons.home,
    },
    {
      "name": "Telefone",
      "icon": FontAwesomeIcons.phone,
    },
    {
      "name": "Lanches",
      "icon": FontAwesomeIcons.utensils,
    },
    {
      "name": "Entretenimento",
      "icon": FontAwesomeIcons.film,
    },
    {
      "name": "Saúde",
      "icon": FontAwesomeIcons.medkit,
    },
    {
      "name": "Transporte",
      "icon": FontAwesomeIcons.bus,
    },
    {
      "name": "Roupas",
      "icon": FontAwesomeIcons.tshirt,
    },
    {
      "name": "Segurança",
      "icon": FontAwesomeIcons.shieldAlt,
    },
    {
      "name": "Educação",
      "icon": FontAwesomeIcons.graduationCap,
    },
    {
      "name": "Outros",
      "icon": FontAwesomeIcons.cartPlus,
    },
  ];

   IconData getExpenseCategoryIcons(String categoryName) {
    final category = homeExpensesCategories.firstWhere(
        (category) => category['name']== categoryName,
        orElse: () => {"icon": FontAwesomeIcons.shoppingCart});
    return category['icon'];
  }
}
