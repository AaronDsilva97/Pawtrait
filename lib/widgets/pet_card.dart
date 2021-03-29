import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String photoUrl;
  final String name;
  final double width;
  PetCard({
    @required this.width,
    @required this.photoUrl,
    @required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: width * 0.4,
      height: width * 0.4 * 1.6,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(width * 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.1),
            ),
            child: Image.network(
              photoUrl == null ? "https://via.placeholder.com/150" : photoUrl,
              width: width * 0.4,
              height: width * 0.4,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'Coco',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Icon(Icons.wc),
                  ],
                ),
                Text("24"),
                Text("Aaron"),
                Text("Aaron"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
