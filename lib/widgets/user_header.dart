import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  final String user;
  final String profileImage;

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  UserHeader({@required this.user, @required this.profileImage});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    String wish = greeting();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: width * 0.025,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                wish,
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: width * 0.07 / 1.6,
                  color: Colors.black,
                ),
              ),
              Text(
                user,
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: width * 0.1 / 1.6,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          PhysicalModel(
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.1 * 1.6),
            ),
            color: Colors.transparent,
            elevation: 12.0,
            child: ClipOval(
              child: Image.network(
                profileImage,
                height: width * 0.1 * 1.6,
                width: width * 0.1 * 1.6,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
