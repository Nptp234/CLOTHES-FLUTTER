import 'dart:ffi';

import 'package:clothes_app/elementes/alert_popup.dart';
import 'package:clothes_app/screens/signup.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget{
  final ValueChanged<bool>? onChanged;

  CheckBox({super.key, this.onChanged});

  static bool isCheck = false;

  @override
  // ignore: library_private_types_in_public_api
  _CheckBoxState createState() => _CheckBoxState();
  
}

class _CheckBoxState extends State<CheckBox>{
  
  @override
  Widget build(BuildContext context) {

    return Checkbox(
      tristate: false,
      value: CheckBox.isCheck,
      activeColor:const Color.fromRGBO(184, 142, 47, 1.000),
      onChanged: (bool? value) {
        setState(() {
          CheckBox.isCheck = value!;
          //call parent widget about the change
          widget.onChanged?.call(value);
        });
      },
    );

  }

  

}