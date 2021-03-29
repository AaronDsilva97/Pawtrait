import 'package:flutter/material.dart';

class IconTag extends StatelessWidget {
  final double width;
  final String value;
  final IconData icon;
  IconTag({
    @required this.width,
    @required this.value,
    @required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 5.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(icon),
          SizedBox(
            width: width * 0.04,
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 30,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
