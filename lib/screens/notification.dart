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
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "Wish" +
                        " " +
                        "Aaron" +
                        " " +
                        "on his" +
                        " " +
                        "3rd" +
                        " " +
                        "birthday today",
                  ),
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://picsum.photos/200/300",
                    ),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text("Wish" + " " + "her"),
                  ),
                  subtitle: Text("Subtitle"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
