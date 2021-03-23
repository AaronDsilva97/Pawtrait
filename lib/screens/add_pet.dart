import 'package:flutter/material.dart';

class AddPet extends StatefulWidget {
  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  TextEditingController _name = TextEditingController();
  TextEditingController _age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Image.network(
              "https://via.placeholder.com/200",
              height: 200,
              width: 200,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Name",
              labelText: "Pet Name",
            ),
            controller: _name,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Age",
              labelText: "Pet Age",
            ),
            controller: _age,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Add New Pet"),
          ),
        ],
      ),
    ));
  }
}
