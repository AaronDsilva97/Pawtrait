import 'package:flutter/cupertino.dart';

class Pet {
  int id;
  String name;
  double age;
  String photoUrl;
  String type;
  String breed;
  String gender;
  String description;

  Pet({
    @required this.id,
    @required this.name,
    @required this.age,
    this.breed,
    this.gender,
    this.photoUrl,
    @required this.type,
    this.description,
  });
}
