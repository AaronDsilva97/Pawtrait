import 'package:flutter/material.dart';
import '../model/pet.dart';

class PetCard extends StatelessWidget {
  final double width;
  final Pet pet;
  PetCard({
    @required this.width,
    @required this.pet,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        "/pet_description",
        arguments: pet,
      ),
      child: Container(
        margin: EdgeInsets.all(5.0),
        width: width * 0.4,
        height: width * 0.4 * 1.6,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(width * 0.1),
              ),
              child: Image.network(
                pet.photoUrl == null
                    ? "https://via.placeholder.com/150"
                    : pet.photoUrl,
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
                        pet.name,
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
      ),
    );
  }
}
