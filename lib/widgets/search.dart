import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final Function onChanged;
  final String hintText;

  Search({
    @required this.onChanged,
    @required this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        // vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: Icon(Icons.search),
          disabledBorder: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
