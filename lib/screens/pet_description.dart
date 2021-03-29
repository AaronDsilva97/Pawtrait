import 'package:flutter/material.dart';
import '../model/pet.dart';

class PetDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pet pet = ModalRoute.of(context).settings.arguments;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              pet.photoUrl == null
                  ? "https://picsum.photos/id/237/200/300"
                  : pet.photoUrl,
              height: width / 1.6,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    pet.name,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 40,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "2 years old",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 20,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/add_appointment"),
              child: Text("Add Appoinment"),
            ),
          ],
        ),
      ),
    );
  }
}
