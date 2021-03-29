import 'package:flutter/material.dart';
import 'package:pawtrait/widgets/profile_card.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                PhysicalModel(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(width * 0.3 / 1.6),
                  ),
                  elevation: 12.0,
                  child: CircleAvatar(
                    radius: width * 0.3 / 1.6,
                    backgroundImage: NetworkImage(
                        "https://picsum.photos/seed/picsum/200/600"),
                  ),
                ),
                ProfileCard(
                  width: width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
