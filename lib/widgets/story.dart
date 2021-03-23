import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: <Widget>[
                ClipOval(
                  child: Image.network(
                    "https://via.placeholder.com/150",
                    height: 80,
                    width: 80,
                  ),
                ),
                Text(
                  "Pet " + index.toString(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
