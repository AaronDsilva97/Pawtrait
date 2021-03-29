import 'package:flutter/cupertino.dart';

class Pet {
  int id;
  String name;
  double age;
  DateTime birthDate;
  String photoUrl;
  String type;
  String breed;
  String gender;
  String description;

  Pet({
    @required this.id,
    @required this.name,
    @required this.age,
    @required this.birthDate,
    this.breed,
    this.gender,
    this.photoUrl,
    @required this.type,
    this.description,
  });
}
