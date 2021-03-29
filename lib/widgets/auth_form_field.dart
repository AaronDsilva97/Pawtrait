import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Function onSaved;
  final Function validator;

  AuthFormField({
    @required this.hintText,
    @required this.labelText,
    @required this.onSaved,
    @required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: InputBorder.none,
        contentPadding:
            const EdgeInsets.only(left: 15.0, bottom: 10.0, top: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
