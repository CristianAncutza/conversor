import 'package:flutter/material.dart';

// ignore: use_function_type_syntax_for_parameters
Widget customDropDown(List<String> item, String value, void onChange(val)) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 18.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: DropdownButton<String>(
        value: value,
        onChanged: (val) {
          onChange(val);
        },
        items:
            null /*item.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem(
          child: Text(val),
          value: val,
        );
      }),*/
        ),
  );
}
