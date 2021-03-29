import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final double width;
  final IconData icon;
  final String hintText;
  final Function onSaved;
  final Function validator;

  ProfileTextField({
    @required this.width,
    @required this.icon,
    @required this.hintText,
    @required this.onSaved,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(icon),
        SizedBox(
          width: width * 0.04,
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
            ),
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}
