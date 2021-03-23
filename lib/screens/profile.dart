import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: <Widget>[
          Text("Profile"),
          ClipOval(
            child: Image.network(
              "https://picsum.photos/seed/picsum/200/600",
              height: width / 1.6,
              width: width / 1.6,
              fit: BoxFit.cover,
            ),
          ),
          Text("Aaron Dsilva"),
          Text("23"),
          Text("Email id"),
          Text("Phone number"),
        ],
      ),
    );
  }
}
