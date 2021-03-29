import 'package:flutter/material.dart';

class PetDescriptionCard extends StatelessWidget {
  final String value;
  final String unit;

  PetDescriptionCard({
    @required this.value,
    @required this.unit,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      elevation: 12.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              value,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              unit,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
