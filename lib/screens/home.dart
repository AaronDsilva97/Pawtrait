import 'package:flutter/material.dart';

import 'quote.dart';
import '../widgets/user_header.dart';
import '../widgets/story.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  UserHeader(
                      user: "Aaron Dsilva",
                      profileImage: "https://picsum.photos/200/300"),
                  Quote(),
                  Story(),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    title: Text("Title"),
                    subtitle: Text("Subtitle"),
                    trailing: Text("Trailing"),
                    leading: Text("Leading"),
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
