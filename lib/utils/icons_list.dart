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
      "name": "Eletracidade",
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
      "name": "Telefône",
      "icon": FontAwesomeIcons.phone,
    },
    {
      "name": "Lanche",
      "icon": FontAwesomeIcons.utensils,
    },
    {
      "name": "Entretenimento",
      "icon": FontAwesomeIcons.film,
    },
    {
      "name": "Saude",
      "icon": FontAwesomeIcons.medkit,
    },
    {
      "name": "Transporte",
      "icon": FontAwesomeIcons.bus,
    },
    {
      "name": "Roupa",
      "icon": FontAwesomeIcons.tshirt,
    },
    {
      "name": "Segutrança",
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
