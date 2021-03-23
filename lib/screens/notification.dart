import 'package:flutter/material.dart';

class PetNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: <Widget>[
          Text("Notification"),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Title"),
                  leading: Text("Leading"),
                  trailing: Text("Trailing"),
                  subtitle: Text("Subtitle"),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
