import 'package:flutter/material.dart';
import '../model/pet.dart';

class PetDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pet pet = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Image.network(
              pet.photoUrl == null
                  ? "https://picsum.photos/id/237/200/300"
                  : pet.photoUrl,
              height: 200,
              width: double.infinity,
            ),
            Text(pet.name),
            Text("Age"),
            Text("User Name"),
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
