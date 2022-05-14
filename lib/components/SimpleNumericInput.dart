import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleNumericInput extends StatelessWidget {

  final TextEditingController? inputController;
  final String? label;
  final String? hint;
  final IconData? icon;

  SimpleNumericInput({ this.inputController, this.label, this.hint, this.icon });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: inputController,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: this.icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}