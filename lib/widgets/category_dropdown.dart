import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/icons_list.dart';

class CategoryDropDown extends StatelessWidget {
  CategoryDropDown({super.key, this.cattype, required this.onChanged});
  final String? cattype;
  final ValueChanged<String?> onChanged;
  var appIcons = AppIcons();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: cattype,
        isExpanded: true,
        hint: Text("Selecione a Categoria"),
        items: appIcons.homeExpensesCategories
            .map((e) => DropdownMenuItem<String>(
                value: e['name'],
                child: Row(
                  children: [
                    Icon(e['icon'],
                    color: Colors.black45,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      e['name'],
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                )))
            .toList(),
        onChanged: onChanged);
  }
}
