import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  final String user;
  final String profileImage;

  UserHeader({@required this.user, @required this.profileImage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Hello, " + user),
          ClipOval(
            child: Image.network(
              profileImage,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
